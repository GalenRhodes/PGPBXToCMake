/************************************************************************//**
 *     PROJECT: PGPBXToCMake
 *    FILENAME: PBXFileReference.m
 *         IDE: AppCode
 *      AUTHOR: Galen Rhodes
 *        DATE: 2018-11-19
 *
 * Copyright © 2018 Project Galen. All rights reserved.
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *//************************************************************************/

#import "PBXFileReference.h"

@implementation PBXFileReference {
    }

    //  1117D9DC70BE474C3D16B0BA /* NSError+PGError.h */ = {
    //      isa = PBXFileReference;
    //      fileEncoding = 4;
    //      lastKnownFileType = sourcecode.c.h;
    //      path = "NSError+PGError.h";
    //      sourceTree = "<group>";
    // };

    -(instancetype)initWithID:(NSString *)pbxID plist:(PBXDict)plist {
        self = [super initWithID:pbxID plist:plist];

        if(self) {
        }

        return self;
    }

    -(NSString *)fileEncodingDescription {
        switch(self.fileEncoding) {
            case PBX_FILE_ENCODING_UTF8:
                return @"UTF8";
            case PBX_FILE_ENCODING_UTF16:
                return @"UTF16";
            case PBX_FILE_ENCODING_UTF16_BE:
                return @"UTF16_BE";
            case PBX_FILE_ENCODING_UTF16_LE:
                return @"UTF16_LE";
            case PBX_FILE_ENCODING_WESTERN:
                return @"Western";
            case PBX_FILE_ENCODING_JAPANESE:
                return @"Japanese";
            case PBX_FILE_ENCODING_TRADITIONALCHINESE:
                return @"Traditional Chinese";
            case PBX_FILE_ENCODING_KOREAN:
                return @"Korean";
            case PBX_FILE_ENCODING_ARABIC:
                return @"Arabic";
            case PBX_FILE_ENCODING_HEBREW:
                return @"Hebrew";
            case PBX_FILE_ENCODING_GREEK:
                return @"Greek";
            case PBX_FILE_ENCODING_CYRILLIC:
                return @"Cyrillic";
            case PBX_FILE_ENCODING_SIMPLIFIEDCHINESE:
                return @"Simplified Chinese";
            case PBX_FILE_ENCODING_CENTRALEUROPEAN:
                return @"Central European";
            case PBX_FILE_ENCODING_TURKISH:
                return @"Turkish";
            case PBX_FILE_ENCODING_ICELANDIC:
                return @"Icelandic";
            default:
                return @"";
        }
    }

    -(NSString *)lastKnownFileTypeDescription {
        return self.plistBranch[@"lastKnownFileType"];
    }

    -(NSString *)path {
        return self.plistBranch[@"path"];
    }

    -(NSString *)name {
        return ([super name] ?: self.path);
    }

    -(NSString *)explicitFileTypeDescription {
        return self.plistBranch[@"explicitFileType"];
    }

    -(BOOL)includeInIndex {
        return BOOLVAL(@"includeInIndex");
    }

    -(PBXFileTypeEnum)lastKnownFileType {
        return [self typeForDescription:self.lastKnownFileTypeDescription];
    }

    -(PBXFileTypeEnum)explicitFileType {
        return [self typeForDescription:self.explicitFileTypeDescription];
    }

    -(NSString *)descriptionForType:(PBXFileTypeEnum)fileType {
        switch(fileType) {
            case PBX_FILE_TYPE_ARCHIVE_AR:
                return @"archive.ar";
            case PBX_FILE_TYPE_ARCHIVE_ASDICTIONARY:
                return @"archive.asdictionary";
            case PBX_FILE_TYPE_ARCHIVE_BINHEX:
                return @"archive.binhex";
            case PBX_FILE_TYPE_ARCHIVE_EAR:
                return @"archive.ear";
            case PBX_FILE_TYPE_ARCHIVE_GZIP:
                return @"archive.gzip";
            case PBX_FILE_TYPE_ARCHIVE_JAR:
                return @"archive.jar";
            case PBX_FILE_TYPE_ARCHIVE_MACBINARY:
                return @"archive.macbinary";
            case PBX_FILE_TYPE_ARCHIVE_PPOB:
                return @"archive.ppob";
            case PBX_FILE_TYPE_ARCHIVE_RSRC:
                return @"archive.rsrc";
            case PBX_FILE_TYPE_ARCHIVE_STUFFIT:
                return @"archive.stuffit";
            case PBX_FILE_TYPE_ARCHIVE_TAR:
                return @"archive.tar";
            case PBX_FILE_TYPE_ARCHIVE_WAR:
                return @"archive.war";
            case PBX_FILE_TYPE_ARCHIVE_ZIP:
                return @"archive.zip";
            case PBX_FILE_TYPE_AUDIO_AIFF:
                return @"audio.aiff";
            case PBX_FILE_TYPE_AUDIO_AU:
                return @"audio.au";
            case PBX_FILE_TYPE_AUDIO_MIDI:
                return @"audio.midi";
            case PBX_FILE_TYPE_AUDIO_MP3:
                return @"audio.mp3";
            case PBX_FILE_TYPE_AUDIO_WAV:
                return @"audio.wav";
            case PBX_FILE_TYPE_COMPILED_MACHO:
                return @"compiled.mach-o";
            case PBX_FILE_TYPE_COMPILED_MACHO_BUNDLE:
                return @"compiled.mach-o.bundle";
            case PBX_FILE_TYPE_COMPILED_MACHO_COREFILE:
                return @"compiled.mach-o.corefile";
            case PBX_FILE_TYPE_COMPILED_MACHO_DYLIB:
                return @"compiled.mach-o.dylib";
            case PBX_FILE_TYPE_COMPILED_MACHO_FVMLIB:
                return @"compiled.mach-o.fvmlib";
            case PBX_FILE_TYPE_COMPILED_MACHO_OBJFILE:
                return @"compiled.mach-o.objfile";
            case PBX_FILE_TYPE_COMPILED_MACHO_PRELOAD:
                return @"compiled.mach-o.preload";
            case PBX_FILE_TYPE_FILE_BPLIST:
                return @"file.bplist";
            case PBX_FILE_TYPE_FILE_XIB:
                return @"file.xib";
            case PBX_FILE_TYPE_IMAGE_BMP:
                return @"image.bmp";
            case PBX_FILE_TYPE_IMAGE_GIF:
                return @"image.gif";
            case PBX_FILE_TYPE_IMAGE_ICNS:
                return @"image.icns";
            case PBX_FILE_TYPE_IMAGE_ICO:
                return @"image.ico";
            case PBX_FILE_TYPE_IMAGE_JPEG:
                return @"image.jpeg";
            case PBX_FILE_TYPE_IMAGE_PDF:
                return @"image.pdf";
            case PBX_FILE_TYPE_IMAGE_PICT:
                return @"image.pict";
            case PBX_FILE_TYPE_IMAGE_PNG:
                return @"image.png";
            case PBX_FILE_TYPE_IMAGE_TIFF:
                return @"image.tiff";
            case PBX_FILE_TYPE_PATTERN_PROXY:
                return @"pattern.proxy";
            case PBX_FILE_TYPE_SOURCECODE_ADA:
                return @"sourcecode.ada";
            case PBX_FILE_TYPE_SOURCECODE_APPLESCRIPT:
                return @"sourcecode.applescript";
            case PBX_FILE_TYPE_SOURCECODE_ASM:
                return @"sourcecode.asm";
            case PBX_FILE_TYPE_SOURCECODE_ASM_ASM:
                return @"sourcecode.asm.asm";
            case PBX_FILE_TYPE_SOURCECODE_ASM_LLVM:
                return @"sourcecode.asm.llvm";
            case PBX_FILE_TYPE_SOURCECODE_C:
                return @"sourcecode.c";
            case PBX_FILE_TYPE_SOURCECODE_C_C_PREPROCESSED:
                return @"sourcecode.c.c.preprocessed";
            case PBX_FILE_TYPE_SOURCECODE_C_H:
                return @"sourcecode.c.h";
            case PBX_FILE_TYPE_SOURCECODE_C_OBJC:
                return @"sourcecode.c.objc";
            case PBX_FILE_TYPE_SOURCECODE_C_OBJC_PREPROCESSED:
                return @"sourcecode.c.objc.preprocessed";
            case PBX_FILE_TYPE_SOURCECODE_CPP_CPP:
                return @"sourcecode.cpp.cpp";
            case PBX_FILE_TYPE_SOURCECODE_CPP_CPP_PREPROCESSED:
                return @"sourcecode.cpp.cpp.preprocessed";
            case PBX_FILE_TYPE_SOURCECODE_CPP_H:
                return @"sourcecode.cpp.h";
            case PBX_FILE_TYPE_SOURCECODE_CPP_OBJCPP:
                return @"sourcecode.cpp.objcpp";
            case PBX_FILE_TYPE_SOURCECODE_CPP_OBJCPP_PREPROCESSED:
                return @"sourcecode.cpp.objcpp.preprocessed";
            case PBX_FILE_TYPE_SOURCECODE_DTRACE:
                return @"sourcecode.dtrace";
            case PBX_FILE_TYPE_SOURCECODE_EXPORTS:
                return @"sourcecode.exports";
            case PBX_FILE_TYPE_SOURCECODE_FORTRAN:
                return @"sourcecode.fortran";
            case PBX_FILE_TYPE_SOURCECODE_FORTRAN_F77:
                return @"sourcecode.fortran.f77";
            case PBX_FILE_TYPE_SOURCECODE_FORTRAN_F90:
                return @"sourcecode.fortran.f90";
            case PBX_FILE_TYPE_SOURCECODE_GLSL:
                return @"sourcecode.glsl";
            case PBX_FILE_TYPE_SOURCECODE_JAM:
                return @"sourcecode.jam";
            case PBX_FILE_TYPE_SOURCECODE_JAVA:
                return @"sourcecode.java";
            case PBX_FILE_TYPE_SOURCECODE_JAVASCRIPT:
                return @"sourcecode.javascript";
            case PBX_FILE_TYPE_SOURCECODE_LEX:
                return @"sourcecode.lex";
            case PBX_FILE_TYPE_SOURCECODE_MAKE:
                return @"sourcecode.make";
            case PBX_FILE_TYPE_SOURCECODE_MIG:
                return @"sourcecode.mig";
            case PBX_FILE_TYPE_SOURCECODE_NASM:
                return @"sourcecode.nasm";
            case PBX_FILE_TYPE_SOURCECODE_OPENCL:
                return @"sourcecode.opencl";
            case PBX_FILE_TYPE_SOURCECODE_PASCAL:
                return @"sourcecode.pascal";
            case PBX_FILE_TYPE_SOURCECODE_REZ:
                return @"sourcecode.rez";
            case PBX_FILE_TYPE_SOURCECODE_YACC:
                return @"sourcecode.yacc";
            case PBX_FILE_TYPE_TEXT:
                return @"text";
            case PBX_FILE_TYPE_TEXT_CSS:
                return @"text.css";
            case PBX_FILE_TYPE_TEXT_HTML_DOCUMENTATION:
                return @"text.html.documentation";
            case PBX_FILE_TYPE_TEXT_MAN:
                return @"text.man";
            case PBX_FILE_TYPE_TEXT_PBXPROJECT:
                return @"text.pbxproject";
            case PBX_FILE_TYPE_TEXT_PLIST:
                return @"text.plist";
            case PBX_FILE_TYPE_TEXT_PLIST_INFO:
                return @"text.plist.info";
            case PBX_FILE_TYPE_TEXT_PLIST_SCRIPTSUITE:
                return @"text.plist.scriptSuite";
            case PBX_FILE_TYPE_TEXT_PLIST_SCRIPTTERMINOLOGY:
                return @"text.plist.scriptTerminology";
            case PBX_FILE_TYPE_TEXT_PLIST_STRINGS:
                return @"text.plist.strings";
            case PBX_FILE_TYPE_TEXT_PLIST_XCLANGSPEC:
                return @"text.plist.xclangspec";
            case PBX_FILE_TYPE_TEXT_PLIST_XCSYNSPEC:
                return @"text.plist.xcsynspec";
            case PBX_FILE_TYPE_TEXT_PLIST_XCTXTMACRO:
                return @"text.plist.xctxtmacro";
            case PBX_FILE_TYPE_TEXT_PLIST_XML:
                return @"text.plist.xml";
            case PBX_FILE_TYPE_TEXT_RTF:
                return @"text.rtf";
            case PBX_FILE_TYPE_TEXT_SCRIPT:
                return @"text.script";
            case PBX_FILE_TYPE_TEXT_SCRIPT_CSH:
                return @"text.script.csh";
            case PBX_FILE_TYPE_TEXT_SCRIPT_PERL:
                return @"text.script.perl";
            case PBX_FILE_TYPE_TEXT_SCRIPT_PHP:
                return @"text.script.php";
            case PBX_FILE_TYPE_TEXT_SCRIPT_PYTHON:
                return @"text.script.python";
            case PBX_FILE_TYPE_TEXTSCRIPT_RUBY:
                return @"textScript.ruby";
            case PBX_FILE_TYPE_TEXT_SCRIPTSH:
                return @"text.scriptSh";
            case PBX_FILE_TYPE_TEXT_SCRIPT_WORKSHEET:
                return @"text.script.worksheet";
            case PBX_FILE_TYPE_TEXT_XCCONFIG:
                return @"text.xcconfig";
            case PBX_FILE_TYPE_TEXT_XML:
                return @"text.xml";
            case PBX_FILE_TYPE_VIDEO_AVI:
                return @"video.avi";
            case PBX_FILE_TYPE_VIDEO_MPEG:
                return @"video.mpeg";
            case PBX_FILE_TYPE_VIDEO_QUARTZCOMPOSER:
                return @"video.quartz-composer";
            case PBX_FILE_TYPE_VIDEO_QUICKTIME:
                return @"video.quicktime";
            case PBX_FILE_TYPE_WRAPPER_APPLICATION:
                return @"wrapper.application";
            case PBX_FILE_TYPE_WRAPPER_CFBUNDLE:
                return @"wrapper.cfbundle";
            case PBX_FILE_TYPE_WRAPPER_FRAMEWORK:
                return @"wrapper.framework";
            case PBX_FILE_TYPE_WRAPPER_PBPROJECT:
                return @"wrapper.pb-project";
            case PBX_FILE_TYPE_SOURCECODE_TEXTBASED_DYLIB_DEFINITION:
                return @"sourcecode.text-based-dylib-definition";
            default:
                return @"none";
        }
    }

    -(PBXFileTypeEnum)typeForDescription:(NSString *)fileTypeDescription {
        PGSWITCH(fileTypeDescription);
            PGCASE(@"archive.ar");
                return PBX_FILE_TYPE_ARCHIVE_AR;
            PGCASE(@"archive.asdictionary");
                return PBX_FILE_TYPE_ARCHIVE_ASDICTIONARY;
            PGCASE(@"archive.binhex");
                return PBX_FILE_TYPE_ARCHIVE_BINHEX;
            PGCASE(@"archive.ear");
                return PBX_FILE_TYPE_ARCHIVE_EAR;
            PGCASE(@"archive.gzip");
                return PBX_FILE_TYPE_ARCHIVE_GZIP;
            PGCASE(@"archive.jar");
                return PBX_FILE_TYPE_ARCHIVE_JAR;
            PGCASE(@"archive.macbinary");
                return PBX_FILE_TYPE_ARCHIVE_MACBINARY;
            PGCASE(@"archive.ppob");
                return PBX_FILE_TYPE_ARCHIVE_PPOB;
            PGCASE(@"archive.rsrc");
                return PBX_FILE_TYPE_ARCHIVE_RSRC;
            PGCASE(@"archive.stuffit");
                return PBX_FILE_TYPE_ARCHIVE_STUFFIT;
            PGCASE(@"archive.tar");
                return PBX_FILE_TYPE_ARCHIVE_TAR;
            PGCASE(@"archive.war");
                return PBX_FILE_TYPE_ARCHIVE_WAR;
            PGCASE(@"archive.zip");
                return PBX_FILE_TYPE_ARCHIVE_ZIP;
            PGCASE(@"audio.aiff");
                return PBX_FILE_TYPE_AUDIO_AIFF;
            PGCASE(@"audio.au");
                return PBX_FILE_TYPE_AUDIO_AU;
            PGCASE(@"audio.midi");
                return PBX_FILE_TYPE_AUDIO_MIDI;
            PGCASE(@"audio.mp3");
                return PBX_FILE_TYPE_AUDIO_MP3;
            PGCASE(@"audio.wav");
                return PBX_FILE_TYPE_AUDIO_WAV;
            PGCASE(@"compiled.mach-o");
                return PBX_FILE_TYPE_COMPILED_MACHO;
            PGCASE(@"compiled.mach-o.bundle");
                return PBX_FILE_TYPE_COMPILED_MACHO_BUNDLE;
            PGCASE(@"compiled.mach-o.corefile");
                return PBX_FILE_TYPE_COMPILED_MACHO_COREFILE;
            PGCASE(@"compiled.mach-o.dylib");
                return PBX_FILE_TYPE_COMPILED_MACHO_DYLIB;
            PGCASE(@"compiled.mach-o.fvmlib");
                return PBX_FILE_TYPE_COMPILED_MACHO_FVMLIB;
            PGCASE(@"compiled.mach-o.objfile");
                return PBX_FILE_TYPE_COMPILED_MACHO_OBJFILE;
            PGCASE(@"compiled.mach-o.preload");
                return PBX_FILE_TYPE_COMPILED_MACHO_PRELOAD;
            PGCASE(@"file.bplist");
                return PBX_FILE_TYPE_FILE_BPLIST;
            PGCASE(@"file.xib");
                return PBX_FILE_TYPE_FILE_XIB;
            PGCASE(@"image.bmp");
                return PBX_FILE_TYPE_IMAGE_BMP;
            PGCASE(@"image.gif");
                return PBX_FILE_TYPE_IMAGE_GIF;
            PGCASE(@"image.icns");
                return PBX_FILE_TYPE_IMAGE_ICNS;
            PGCASE(@"image.ico");
                return PBX_FILE_TYPE_IMAGE_ICO;
            PGCASE(@"image.jpeg");
                return PBX_FILE_TYPE_IMAGE_JPEG;
            PGCASE(@"image.pdf");
                return PBX_FILE_TYPE_IMAGE_PDF;
            PGCASE(@"image.pict");
                return PBX_FILE_TYPE_IMAGE_PICT;
            PGCASE(@"image.png");
                return PBX_FILE_TYPE_IMAGE_PNG;
            PGCASE(@"image.tiff");
                return PBX_FILE_TYPE_IMAGE_TIFF;
            PGCASE(@"pattern.proxy");
                return PBX_FILE_TYPE_PATTERN_PROXY;
            PGCASE(@"sourcecode.ada");
                return PBX_FILE_TYPE_SOURCECODE_ADA;
            PGCASE(@"sourcecode.applescript");
                return PBX_FILE_TYPE_SOURCECODE_APPLESCRIPT;
            PGCASE(@"sourcecode.asm");
                return PBX_FILE_TYPE_SOURCECODE_ASM;
            PGCASE(@"sourcecode.asm.asm");
                return PBX_FILE_TYPE_SOURCECODE_ASM_ASM;
            PGCASE(@"sourcecode.asm.llvm");
                return PBX_FILE_TYPE_SOURCECODE_ASM_LLVM;
            PGCASE(@"sourcecode.c");
                return PBX_FILE_TYPE_SOURCECODE_C;
            PGCASE(@"sourcecode.c.c.preprocessed");
                return PBX_FILE_TYPE_SOURCECODE_C_C_PREPROCESSED;
            PGCASE(@"sourcecode.c.h");
                return PBX_FILE_TYPE_SOURCECODE_C_H;
            PGCASE(@"sourcecode.c.objc");
                return PBX_FILE_TYPE_SOURCECODE_C_OBJC;
            PGCASE(@"sourcecode.c.objc.preprocessed");
                return PBX_FILE_TYPE_SOURCECODE_C_OBJC_PREPROCESSED;
            PGCASE(@"sourcecode.cpp.cpp");
                return PBX_FILE_TYPE_SOURCECODE_CPP_CPP;
            PGCASE(@"sourcecode.cpp.cpp.preprocessed");
                return PBX_FILE_TYPE_SOURCECODE_CPP_CPP_PREPROCESSED;
            PGCASE(@"sourcecode.cpp.h");
                return PBX_FILE_TYPE_SOURCECODE_CPP_H;
            PGCASE(@"sourcecode.cpp.objcpp");
                return PBX_FILE_TYPE_SOURCECODE_CPP_OBJCPP;
            PGCASE(@"sourcecode.cpp.objcpp.preprocessed");
                return PBX_FILE_TYPE_SOURCECODE_CPP_OBJCPP_PREPROCESSED;
            PGCASE(@"sourcecode.dtrace");
                return PBX_FILE_TYPE_SOURCECODE_DTRACE;
            PGCASE(@"sourcecode.exports");
                return PBX_FILE_TYPE_SOURCECODE_EXPORTS;
            PGCASE(@"sourcecode.fortran");
                return PBX_FILE_TYPE_SOURCECODE_FORTRAN;
            PGCASE(@"sourcecode.fortran.f77");
                return PBX_FILE_TYPE_SOURCECODE_FORTRAN_F77;
            PGCASE(@"sourcecode.fortran.f90");
                return PBX_FILE_TYPE_SOURCECODE_FORTRAN_F90;
            PGCASE(@"sourcecode.glsl");
                return PBX_FILE_TYPE_SOURCECODE_GLSL;
            PGCASE(@"sourcecode.jam");
                return PBX_FILE_TYPE_SOURCECODE_JAM;
            PGCASE(@"sourcecode.java");
                return PBX_FILE_TYPE_SOURCECODE_JAVA;
            PGCASE(@"sourcecode.javascript");
                return PBX_FILE_TYPE_SOURCECODE_JAVASCRIPT;
            PGCASE(@"sourcecode.lex");
                return PBX_FILE_TYPE_SOURCECODE_LEX;
            PGCASE(@"sourcecode.make");
                return PBX_FILE_TYPE_SOURCECODE_MAKE;
            PGCASE(@"sourcecode.mig");
                return PBX_FILE_TYPE_SOURCECODE_MIG;
            PGCASE(@"sourcecode.nasm");
                return PBX_FILE_TYPE_SOURCECODE_NASM;
            PGCASE(@"sourcecode.opencl");
                return PBX_FILE_TYPE_SOURCECODE_OPENCL;
            PGCASE(@"sourcecode.pascal");
                return PBX_FILE_TYPE_SOURCECODE_PASCAL;
            PGCASE(@"sourcecode.rez");
                return PBX_FILE_TYPE_SOURCECODE_REZ;
            PGCASE(@"sourcecode.yacc");
                return PBX_FILE_TYPE_SOURCECODE_YACC;
            PGCASE(@"text");
                return PBX_FILE_TYPE_TEXT;
            PGCASE(@"text.css");
                return PBX_FILE_TYPE_TEXT_CSS;
            PGCASE(@"text.html.documentation");
                return PBX_FILE_TYPE_TEXT_HTML_DOCUMENTATION;
            PGCASE(@"text.man");
                return PBX_FILE_TYPE_TEXT_MAN;
            PGCASE(@"text.pbxproject");
                return PBX_FILE_TYPE_TEXT_PBXPROJECT;
            PGCASE(@"text.plist");
                return PBX_FILE_TYPE_TEXT_PLIST;
            PGCASE(@"text.plist.info");
                return PBX_FILE_TYPE_TEXT_PLIST_INFO;
            PGCASE(@"text.plist.scriptSuite");
                return PBX_FILE_TYPE_TEXT_PLIST_SCRIPTSUITE;
            PGCASE(@"text.plist.scriptTerminology");
                return PBX_FILE_TYPE_TEXT_PLIST_SCRIPTTERMINOLOGY;
            PGCASE(@"text.plist.strings");
                return PBX_FILE_TYPE_TEXT_PLIST_STRINGS;
            PGCASE(@"text.plist.xclangspec");
                return PBX_FILE_TYPE_TEXT_PLIST_XCLANGSPEC;
            PGCASE(@"text.plist.xcsynspec");
                return PBX_FILE_TYPE_TEXT_PLIST_XCSYNSPEC;
            PGCASE(@"text.plist.xctxtmacro");
                return PBX_FILE_TYPE_TEXT_PLIST_XCTXTMACRO;
            PGCASE(@"text.plist.xml");
                return PBX_FILE_TYPE_TEXT_PLIST_XML;
            PGCASE(@"text.rtf");
                return PBX_FILE_TYPE_TEXT_RTF;
            PGCASE(@"text.script");
                return PBX_FILE_TYPE_TEXT_SCRIPT;
            PGCASE(@"text.script.csh");
                return PBX_FILE_TYPE_TEXT_SCRIPT_CSH;
            PGCASE(@"text.script.perl");
                return PBX_FILE_TYPE_TEXT_SCRIPT_PERL;
            PGCASE(@"text.script.php");
                return PBX_FILE_TYPE_TEXT_SCRIPT_PHP;
            PGCASE(@"text.script.python");
                return PBX_FILE_TYPE_TEXT_SCRIPT_PYTHON;
            PGCASE(@"textScript.ruby");
                return PBX_FILE_TYPE_TEXTSCRIPT_RUBY;
            PGCASE(@"text.scriptSh");
                return PBX_FILE_TYPE_TEXT_SCRIPTSH;
            PGCASE(@"text.script.worksheet");
                return PBX_FILE_TYPE_TEXT_SCRIPT_WORKSHEET;
            PGCASE(@"text.xcconfig");
                return PBX_FILE_TYPE_TEXT_XCCONFIG;
            PGCASE(@"text.xml");
                return PBX_FILE_TYPE_TEXT_XML;
            PGCASE(@"video.avi");
                return PBX_FILE_TYPE_VIDEO_AVI;
            PGCASE(@"video.mpeg");
                return PBX_FILE_TYPE_VIDEO_MPEG;
            PGCASE(@"video.quartz-composer");
                return PBX_FILE_TYPE_VIDEO_QUARTZCOMPOSER;
            PGCASE(@"video.quicktime");
                return PBX_FILE_TYPE_VIDEO_QUICKTIME;
            PGCASE(@"wrapper.application");
                return PBX_FILE_TYPE_WRAPPER_APPLICATION;
            PGCASE(@"wrapper.cfbundle");
                return PBX_FILE_TYPE_WRAPPER_CFBUNDLE;
            PGCASE(@"wrapper.framework");
                return PBX_FILE_TYPE_WRAPPER_FRAMEWORK;
            PGCASE(@"wrapper.pb-project");
                return PBX_FILE_TYPE_WRAPPER_PBPROJECT;
            PGCASE(@"sourcecode.text-based-dylib-definition");
                return PBX_FILE_TYPE_SOURCECODE_TEXTBASED_DYLIB_DEFINITION;
            PGDEFAULT;
                return PBX_FILE_TYPE_NONE;
        PGSWITCHEND;
    }

    -(PBXFileEncodingEnum)fileEncoding {
        switch(INTVAL(@"fileEncoding")) {
            case PBX_FILE_ENCODING_UTF8:
                return PBX_FILE_ENCODING_UTF8;
            case PBX_FILE_ENCODING_UTF16:
                return PBX_FILE_ENCODING_UTF16;
            case PBX_FILE_ENCODING_UTF16_BE:
                return PBX_FILE_ENCODING_UTF16_BE;
            case PBX_FILE_ENCODING_UTF16_LE:
                return PBX_FILE_ENCODING_UTF16_LE;
            case PBX_FILE_ENCODING_WESTERN:
                return PBX_FILE_ENCODING_WESTERN;
            case PBX_FILE_ENCODING_JAPANESE:
                return PBX_FILE_ENCODING_JAPANESE;
            case PBX_FILE_ENCODING_TRADITIONALCHINESE:
                return PBX_FILE_ENCODING_TRADITIONALCHINESE;
            case PBX_FILE_ENCODING_KOREAN:
                return PBX_FILE_ENCODING_KOREAN;
            case PBX_FILE_ENCODING_ARABIC:
                return PBX_FILE_ENCODING_ARABIC;
            case PBX_FILE_ENCODING_HEBREW:
                return PBX_FILE_ENCODING_HEBREW;
            case PBX_FILE_ENCODING_GREEK:
                return PBX_FILE_ENCODING_GREEK;
            case PBX_FILE_ENCODING_CYRILLIC:
                return PBX_FILE_ENCODING_CYRILLIC;
            case PBX_FILE_ENCODING_SIMPLIFIEDCHINESE:
                return PBX_FILE_ENCODING_SIMPLIFIEDCHINESE;
            case PBX_FILE_ENCODING_CENTRALEUROPEAN:
                return PBX_FILE_ENCODING_CENTRALEUROPEAN;
            case PBX_FILE_ENCODING_TURKISH:
                return PBX_FILE_ENCODING_TURKISH;
            case PBX_FILE_ENCODING_ICELANDIC:
                return PBX_FILE_ENCODING_ICELANDIC;
            default:
                return PBX_FILE_ENCODING_DEFAULT;
        }
    }

@end
