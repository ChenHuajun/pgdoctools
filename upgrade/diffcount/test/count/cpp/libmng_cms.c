/* ************************************************************************** */
/* *             For conditions of distribution and use,                    * */
/* *                see copyright notice in libmng.h                        * */
/* ************************************************************************** */
/* *                                                                        * */
/* * project   : libmng                                                     * */
/* * file      : libmng_cms.c              copyright (c) 2000 G.Juyn        * */
/* * version   : 1.0.1                                                      * */
/* *                                                                        * */
/* * purpose   : color management routines (implementation)                 * */
/* *                                                                        * */
/* ************************************************************************** */

#include "libmng.h"
#include "libmng_data.h"
#include "libmng_error.h"
#include "libmng_trace.h"
#ifdef __BORLANDC__
#pragma hdrstop
#endif
#include "libmng_objects.h"
#include "libmng_cms.h"

#if defined(__BORLANDC__) && defined(MNG_STRICT_ANSI)
#pragma option -A                      /* force ANSI-C */
#endif

/* ************************************************************************** */

#ifdef MNG_INCLUDE_DISPLAY_PROCS

/* ************************************************************************** */
/* *                                                                        * */
/* * Little CMS helper routines                                             * */
/* *                                                                        * */
/* ************************************************************************** */

#ifdef MNG_INCLUDE_LCMS

#define MNG_CMS_FLAGS 0

/* ************************************************************************** */

void mnglcms_initlibrary ()
{
  cmsErrorAction (LCMS_ERROR_IGNORE);  /* LCMS should ignore errors! */
}

/* ************************************************************************** */

mng_cmsprof mnglcms_createfileprofile (mng_pchar zFilename)
{
  return cmsOpenProfileFromFile (zFilename, "r");
}

/* ************************************************************************** */

mng_cmsprof mnglcms_creatememprofile (mng_uint32 iProfilesize,
                                      mng_ptr    pProfile)
{
  return cmsOpenProfileFromMem (pProfile, iProfilesize);
}

/* ************************************************************************** */

mng_cmsprof mnglcms_createsrgbprofile (void)
{
  cmsCIExyY       D65;
  cmsCIExyYTRIPLE Rec709Primaries = {
                                      {0.6400, 0.3300, 1.0},
                                      {0.3000, 0.6000, 1.0},
                                      {0.1500, 0.0600, 1.0}
                                    };
  LPGAMMATABLE    Gamma24[3];
  mng_cmsprof     hsRGB;

  cmsWhitePointFromTemp(6504, &D65);
  Gamma24[0] = Gamma24[1] = Gamma24[2] = cmsBuildGamma(256, 2.4);
  hsRGB = cmsCreateRGBProfile(&D65, &Rec709Primaries, Gamma24);
  cmsFreeGamma(Gamma24[0]);

  return hsRGB;
}

/* ************************************************************************** */

void mnglcms_freeprofile (mng_cmsprof hProf)
{
  cmsCloseProfile (hProf);
  return;
}

/* ************************************************************************** */

void mnglcms_freetransform (mng_cmstrans hTrans)
{
/* B001 start */
  cmsDeleteTransform (hTrans);
/* B001 end */
  return;
}

/* ************************************************************************** */

mng_retcode mng_clear_cms (mng_datap pData)
{
#ifdef MNG_SUPPORT_TRACE
  MNG_TRACE (pData, MNG_FN_CLEAR_CMS, MNG_LC_START)
#endif

  if (pData->hTrans)                   /* transformation still active ? */
    mnglcms_freetransform (pData->hTrans);

  pData->hTrans = 0;

  if (pData->hProf1)                   /* file profile still active ? */
    mnglcms_freeprofile (pData->hProf1);

  pData->hProf1 = 0;

#ifdef MNG_SUPPORT_TRACE
  MNG_TRACE (pData, MNG_FN_CLEAR_CMS, MNG_LC_END)
#endif

  return MNG_NOERROR;
}

/* ************************************************************************** */

#endif /* MNG_INCLUDE_LCMS */


/* ************************************************************************** */
/* * end of file                                                            * */
/* ************************************************************************** */



