//
//  BBLiveStreamingSession.m
//  BBLiveSDK
//
//  Created by linzuhan on 2018/5/30.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveStreamingSession.h"
#import <PLRTCStreamingKit/PLRTCStreamingKit.h>

@interface BBLiveStreamingSession ()

// 采集
@property (nonatomic, strong) PLVideoCaptureConfiguration *videoCaptureConfiguration;
@property (nonatomic, strong) PLAudioCaptureConfiguration *audioCaptureConfiguration;

// 推流
@property (nonatomic, strong) PLVideoStreamingConfiguration *videoStreamingConfiguration;
@property (nonatomic, strong) PLAudioStreamingConfiguration *audioStreamingConfiguration;

@property (nonatomic, strong) PLMediaStreamingSession *session;

@end

@implementation BBLiveStreamingSession

- (PLVideoCaptureConfiguration *)videoCaptureConfiguration
{
    if (!_videoCaptureConfiguration) {
        _videoCaptureConfiguration = [PLVideoCaptureConfiguration defaultConfiguration];
    }
    
    return _videoCaptureConfiguration;
}

- (PLAudioCaptureConfiguration *)audioCaptureConfiguration
{
    if (!_audioCaptureConfiguration) {
        _audioCaptureConfiguration = [PLAudioCaptureConfiguration defaultConfiguration];
    }
    
    return _audioCaptureConfiguration;
}

- (PLVideoStreamingConfiguration *)videoStreamingConfiguration
{
    if (!_videoStreamingConfiguration) {
        _videoStreamingConfiguration = [PLVideoStreamingConfiguration defaultConfiguration];
    }
    
    return _videoStreamingConfiguration;
}

- (PLAudioStreamingConfiguration *)audioStreamingConfiguration
{
    if (!_audioStreamingConfiguration) {
        _audioStreamingConfiguration = [PLAudioStreamingConfiguration defaultConfiguration];
    }
    
    return _audioStreamingConfiguration;
}

- (PLMediaStreamingSession *)session
{
    if (!_session) {
        _session = [[PLMediaStreamingSession alloc] initWithVideoCaptureConfiguration:self.videoCaptureConfiguration
                                                            audioCaptureConfiguration:self.audioCaptureConfiguration
                                                          videoStreamingConfiguration:self.videoStreamingConfiguration
                                                          audioStreamingConfiguration:self.audioStreamingConfiguration
                                                                               stream:nil];
    }
    
    return _session;
}

- (UIView *)livePreview
{
    return self.session.previewView;
}

@end
