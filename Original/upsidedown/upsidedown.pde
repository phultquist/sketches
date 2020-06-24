import gab.opencv.Contour;
import gab.opencv.ContourComparator;
import gab.opencv.Histogram;
import gab.opencv.Line;
import gab.opencv.Flow;
//import gab.opecv.

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.awt.image.DataBufferInt;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.IntBuffer;
import java.io.File;
import java.lang.reflect.Field;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;

import org.opencv.core.Core;
import org.opencv.core.CvType;
import org.opencv.core.Mat;
import org.opencv.core.MatOfRect;
import org.opencv.core.MatOfPoint;
import org.opencv.core.MatOfPoint2f;
import org.opencv.core.MatOfInt;
import org.opencv.core.MatOfFloat;
import org.opencv.core.Rect;
import org.opencv.core.Scalar;
import org.opencv.core.Size;
import org.opencv.core.Point;
import org.opencv.calib3d.Calib3d;
import org.opencv.core.CvException;
import org.opencv.core.Core.MinMaxLocResult;
import org.opencv.video.BackgroundSubtractorMOG;
import org.opencv.objdetect.CascadeClassifier;
import org.opencv.imgproc.Imgproc;

import processing.core.*;

CascadeClassifier face;
