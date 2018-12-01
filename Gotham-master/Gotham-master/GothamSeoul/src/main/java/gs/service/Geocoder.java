package gs.service;

import org.osgeo.proj4j.CRSFactory;
import org.osgeo.proj4j.CoordinateReferenceSystem;
import org.osgeo.proj4j.CoordinateTransform;
import org.osgeo.proj4j.CoordinateTransformFactory;
import org.osgeo.proj4j.ProjCoordinate;

public class Geocoder {

	public double[] proj4(String[] point) {
		
		CoordinateTransformFactory ctFactory = new CoordinateTransformFactory();
		CRSFactory csFactory = new CRSFactory();
		
		CoordinateReferenceSystem fromRef = csFactory.createFromParameters("EPSG:5181", "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=GRS80 +units=m +no_defs");
		// projection1 : *중부원점(GRS80)-falseY:50000, 다음지도에서 사용중인 좌표계
		// EPSG:5181
		// +proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=GRS80 +units=m +no_defs

		CoordinateReferenceSystem toRef = csFactory.createFromParameters("EPSG:4019", "+proj=longlat +ellps=GRS80 +no_defs");
		// projection2 : *GRS80 경위도
		// EPSG:4019, EPSG:4737 (Korean 2000)
		// +proj=longlat +ellps=GRS80 +no_defs

		CoordinateTransform trans = ctFactory.createTransform(fromRef, toRef);
		
		ProjCoordinate fromPoint = new ProjCoordinate();
		fromPoint.x = Double.parseDouble(point[0]);
		fromPoint.y = Double.parseDouble(point[1]);
		
		ProjCoordinate toPoint = new ProjCoordinate();
		trans.transform(fromPoint, toPoint);

		double[] result = {toPoint.x, toPoint.y};
		
		return result;
		
//        CoordinateTransformFactory ctFactory = new CoordinateTransformFactory();
//        CRSFactory csFactory = new CRSFactory();
//        CoordinateReferenceSystem HK80 = csFactory.createFromParameters("EPSG:2326", "+proj=tmerc +lat_0=22.31213333333334 +lon_0=114.1785555555556 +k=1 +x_0=836694.05 +y_0=819069.8 +ellps=intl +towgs84=-162.619,-276.959,-161.764,0.067753,-2.24365,-1.15883,-1.09425 +units=m +no_defs");
//        CoordinateReferenceSystem WGS84 = csFactory.createFromParameters("WGS84", "+proj=longlat +datum=WGS84 +no_defs");
//        CoordinateTransform trans = ctFactory.createTransform(HK80, WGS84);
//        ProjCoordinate p = new ProjCoordinate();
//        ProjCoordinate p2 = new ProjCoordinate();
//        p.x = pair.first;
//        p.y = pair.second;
//        trans.transform(p, p2);
//        return new Pair<>(p2.x, p2.y);
	}
}
