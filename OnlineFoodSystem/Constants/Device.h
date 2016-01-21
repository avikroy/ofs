//
//  Device.h
//  OnlineFoodSystem
//
//  Created by Kaustav Shee on 24/08/15.
//  Copyright (c) 2015 Kaustav Shee. All rights reserved.
//

#ifndef OnlineFoodSystem_Device_h
#define OnlineFoodSystem_Device_h


#endif

#define __kDeviceIphone4s [[UIScreen mainScreen] bounds].size.height==480||[[UIScreen mainScreen] bounds].size.width==480

#define __kDeviceIphone5s [[UIScreen mainScreen] bounds].size.height==568||[[UIScreen mainScreen] bounds].size.width==568

#define __kDeviceIphone6 [[UIScreen mainScreen] bounds].size.height==667||[[UIScreen mainScreen] bounds].size.width==667

#define __kDeviceIphone6Plus [[UIScreen mainScreen] bounds].size.height==736||[[UIScreen mainScreen] bounds].size.width==736

#define __kDeviceIPad [[UIScreen mainScreen] bounds].size.height==1024||[[UIScreen mainScreen] bounds].size.width==1024
