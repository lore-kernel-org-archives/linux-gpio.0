Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA0E3BFE5A;
	Fri,  4 Sep 2026 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512787; cv=none; b=cmJZ1nV7Apj1HezMcgoHZQgaaMq6Zxxotzg5PmLhL7HAwDF7AttfQHoSTBlR8YDPHyXaSki0cya5TTbm3GMJJ6ZJIwkE6uTkRWAmaaMHvMthFqw8gZ4cxquJlkYgXB+rPZriWdkbV9A0r0XaCpLu2ON2GT1X9v7eV4SWKtCMceU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512787; c=relaxed/simple;
	bh=1cscPY3kd0b6N4dEtO/vkcgtwzZZrxk1O+5dXHkYtOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEr2fhOxb4QIWZ6Bvebd4qDVtMWPI79jIIjo7Buc0sCKeYb4eVCo3zPBzDHXJYhPvugJzJpOIKR2Zb8i30QfVrnZLFawln7mZET4il8a4lYESpI5bp/iGxP08ytbqrLQiH4W8p+nR2xa4Rc9megUXd5RRbWPVTgDtEHgepkeN+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ofhroCgi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bHfrFkEE; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ofhroCgi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bHfrFkEE"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0CF717A01B9;
	Fri,  4 Sep 2026 05:06:22 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 04 Sep 2026 05:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788512781;
	 x=1788599181; bh=lU/h6c8TFFiutxRZWZYSZVBL6v8FXTYbhUTGHMkRcFY=; b=
	ofhroCgiUdqLVz8NSk8BV9kt2hlgYPQETtriBMRzE4ytTSnGnpp48lvIWwFAykPR
	uOXU81ej33aBL6WlCp+hLfzoo1itmI0HYejHOR+PIKr/GmV5YmvAP+EZoGrKUOME
	LfFTEoWlocNxEcQa1i2pT3XbOSTY78Q6Mjlks549npnz00j13tKL+5ZYcu71we3e
	tmDEOUf8hZHg9s5SznEv44xXrto0LmaceQT+N6xzi5/YuAhz+RQU+CiiVoEspdVx
	pdaWt3TS8phB/8GM6lnwgjeHJFMCTu9Sg9gEOMatY0tIkl2GH/uG8+ae8vrgnd+t
	Hr/3P1RJBMPzAHGeIQBHjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788512781; x=
	1788599181; bh=lU/h6c8TFFiutxRZWZYSZVBL6v8FXTYbhUTGHMkRcFY=; b=b
	HfrFkEEv756/N/E8SsnNZFCIonW242QtFm9aKXUgU3q0kCVFcJQVyfHaVQCB/HQZ
	om5HW4WUPeBt1UnoGNa5ktNUfvJp6ywJ0l9Hlk1UGTtYklvZ2U9VS4bg5S2BL/mT
	7aVmJawiZHfzpcuvQ8ukxvsR9X282cGFfLhpCAxDY97eighqddt/f3+s/BihkMCP
	QM+zSYkQswUwai8IMKvrPTt4A/SjmC9T6Ge06/WQx2O4SLULwjmFMbkHzswpXWiq
	G8kM4L8nszEAdPkmZGuiDx+Phf5i9NHEJHx6bzLHqvjmQ4ArSrR2xJE8pIHWqFOd
	PtIdhPMaUaMyUosoGGGdw==
X-ME-Sender: <xms:DYqaarUSRmnYZ0HETtLPE_mlh3EPEh3IRnCnFjq8VJfGCg5RrTzB1g>
    <xme:DYqaaodsUnmKVG4Ncu8NaEkJ0eF83fk-yiekCM-G8Mw0QcdBEZvgl9XNYdYggUCUO
    rdYPASl4gOy5WKDrrAOq9Uwya3LVFy_ZaX9kx2sCVCRt-Aq-p3GKGg5>
X-ME-Received: <xmr:DYqaav_HWQeuZDiMRQRiLlKLU5IHZHy2NaJY4VHDgTr7VmVuApRb2crZTAlSekbJ9SFW5yp7oT8Rr0xSPtJ5MXIU9427RgE>
X-ME-Proxy-Cause: dmFkZTE5QdSYLbS/PrS3ATDE/D/X9jjrMsbntoK6a7Fkvfv1q1DNkAbd0h6dd04ZPNIYp+
    6BHYFZT2xT4ud1SeZlS2iz3nLYIsORYKNVeUUa0UuNYW6bc03H7cdq2jhSokycoVfmRbRh
    6yo6qbUN21ubBsTyCCNaHwJ+jfQe6uB9MH8csFhwWtJ71SPv9a8ogNRKEMJvRdIMLnBcAW
    L+Md3aSK1svaCNniOSYgAJaBFxhM7a+OT8L8YVu7ck/PpyrghjoGB1EUa/+yEW/tqWKKDA
    wC/h9OwvJEeWY/rPfV7DLeoFhoXYNDv/ZsHbqagYKFPRATWEQ0E2fylkEvOileTPjMQHSZ
    JnV6v6qgdPTfIYbxzxt+mzxqWPdJ5ffME2DxIGtZpG6Fn+K4tj3YNzJ7bfzwqqwWj5D5WI
    Z1wJqpAWRjWC4bXIwGOxiKGbf3jwFmY2j4R4L9ipQHdtMlDe/LnshZBwsg0ToelVIQwOfk
    XGNOHQjK7ff7Aipw37BAcirABQhWP8GGo7lp+PB5Kfh7fN8Gjv8StGuWWrU0c0CCkL6yxp
    cxlV56jake7tH+Zw83CWaaLPye5r6ASzeDLas85B3gSHRFkCX81m0yKiE4SijRBD+XgBpl
    xiM0gN8kCdk7JHgV8DlwHq/R5Lri5HCnjT/4Nyy3LfRfBlDvMHcn9j2rc3yg
X-ME-Proxy: <xmx:DYqaanmQACggS2Tchx7tlkzcSUK2JdW6hJb8njLjZdG_Cxgi-T31jg>
    <xmx:DYqaaoggqrATbCf7OW3wRdzWIKzonN-cmqXs3fQ2NwTqX7R0fQJhcg>
    <xmx:DYqaavbzfFIpK307mfRn0Oo2MTNOQ6QBcqQz_wujXcDRfFetHZVoCQ>
    <xmx:DYqaasGclhgdCwIYaWeADfWgCqHBCwLOknqRfZDPd1UQcs40MEkj4w>
    <xmx:DYqaak8CgdW66dW1TjqLREy0fcFSOgSvHFKtIqgocLD98Vjn3a5ndsUI>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Sep 2026 05:06:20 -0400 (EDT)
Date: Fri, 4 Sep 2026 11:06:17 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dumitru.ceclan@analog.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	mitrutzceclan@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Andrian Suciu <Adrian.Suciu@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Vivekananda Dayananda <vivekana@amd.com>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <20260904090617.GB3497753@ragnatech.se>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <a52efd67-13b2-4377-8fba-4523b4c9780f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="mKYtYBfWo49ZJWkq"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a52efd67-13b2-4377-8fba-4523b4c9780f@ideasonboard.com>

--mKYtYBfWo49ZJWkq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Tomi,

On 2026-09-04 11:55:08 +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 31/08/2026 16:21, Dumitru Ceclan via B4 Relay wrote:
> > This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
> > replacing the few GMSL2 drivers already in upstream, and introducing a
> > common framework that can be used to implement such GMSL chips, which
> > avoids code duplication while also adding support for previously
> > unsupported features.
> I had a quick test with this v16, and while cameras and serializer TPGs
> work, I still can't get anything from deser TPG. I'm trying to capture
> 1920x1080-XRGB8888. There could be something wrong with the media config I
> do from the userspace, though.
> 
> Niklas, what settings you used with TPG on MAX96712?

Attached is the complete log from my CI pipeline. I'm sorry about all 
the start and end markers added by systemd.. I'm trying to find a clever 
way to remove them.


> 
>  Tomi
> 

-- 
Kind Regards,
Niklas Söderlund

--mKYtYBfWo49ZJWkq
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename=vin-v3u.log

Renesas Falcon CPU and Breakout boards based on r8a779a0
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo rcbqncvbrf $$; rm -fr /tmp/vin-capture; echo icwpiyjrwd $?
echo rcbqncvbrf $$; rm -fr /tmp/vin-capture; echo icwpiyjrwd $?
3008;start=6ae66edd-359a-4f62-aa49-720d430cf720;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\rcbqncvbrf 869
icwpiyjrwd 0
3008;end=6ae66edd-359a-4f62-aa49-720d430cf720;exit=success\echo sydudqwqly $$; mkdir -p /tmp/vin-capture; echo uizbulzztf $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo sydudqwqly $$; mkdir -p /tmp/vin-capture; echo uizbulzztf $?
3008;start=e325a517-5756-4486-9ea9-bf599663917b;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\sydudqwqly 869
uizbulzztf 0
3008;end=e325a517-5756-4486-9ea9-bf599663917b;exit=success\echo pcftcjnpvm $$; basename $(\ls -1 -d /sys/bus/platform/drivers/rcar-vin/*.video/media*); echo rjcwsquaxe $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo pcftcjnpvm $$; basename $(\ls -1 -d /sys/bus/platform/drivers/rcar-vin/*.video/media*); echo rjcwsquaxe $?
3008;start=1713ef21-22b4-4ba1-9118-f39133658ae7;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\pcftcjnpvm 869
media0
rjcwsquaxe 0
echo edyuxtrjtk $$; media-ctl -d /dev/media0 -r; echo eijnmfxywb $?
3008;end=1713ef21-22b4-4ba1-9118-f39133658ae7;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo edyuxtrjtk $$; media-ctl -d /dev/media0 -r; echo eijnmfxywb $?
3008;start=661ca835-b6ac-4e11-8a6c-c1bd11de0482;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\edyuxtrjtk 869
eijnmfxywb 0
3008;end=661ca835-b6ac-4e11-8a6c-c1bd11de0482;exit=success\echo tjmiijrrrp $$; media-ctl -d /dev/media0 --set-routes "'max96724 1-0049' [8/0 -> 4/0 [1]]"; echo oxcrpmtlcy $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo tjmiijrrrp $$; media-ctl -d /dev/media0 --set-routes "'max96724 1-0049' [8/0 -> 4/0 [1]]"; echo oxcrpmtlcy $?
3008;start=5e2d09d9-90d2-420a-8386-9da00f13569d;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\tjmiijrrrp 869
oxcrpmtlcy 0
echo tflcqtvdiu $$; media-ctl -d /dev/media0 --get-v4l2 "'max96724 1-0049':8"; echo lkuyajjaii $?
3008;end=5e2d09d9-90d2-420a-8386-9da00f13569d;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo tflcqtvdiu $$; media-ctl -d /dev/media0 --get-v4l2 "'max96724 1-0049':8"; echo lkuyajjaii $?
3008;start=2450ab61-9fc5-4217-8daa-a357048d051a;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\tflcqtvdiu 869
		[stream:0 fmt:RGB888_1X24/640x480]
lkuyajjaii 0
3008;end=2450ab61-9fc5-4217-8daa-a357048d051a;exit=success\echo ocpawxmhma $$; media-ctl -d /dev/media0 -V "'max96724 1-0049':8 [fmt:RGB888_1X24/1920x1080 field:none]"; echo btoyibixrq $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo ocpawxmhma $$; media-ctl -d /dev/media0 -V "'max96724 1-0049':8 [fmt:RGB888_1X24/1920x1080 field:none]"; echo btoyibixrq $?
3008;start=cc53a835-f9ac-4c72-8550-aae5c3a133d5;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\ocpawxmhma 869
btoyibixrq 0
3008;end=cc53a835-f9ac-4c72-8550-aae5c3a133d5;exit=success\echo eigybydofi $$; media-ctl -d /dev/media0 -V "'rcar_csi2 feaa0000.csi2':0 [fmt:RGB888_1X24/1920x1080 field:none]"; echo psqaoupyae $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo eigybydofi $$; media-ctl -d /dev/media0 -V "'rcar_csi2 feaa0000.csi2':0 [fmt:RGB888_1X24/1920x1080 field:none]"; echo psqaoupyae $?
3008;start=304879b1-d4a1-4ed7-9675-a6ee6c45c3d4;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\eigybydofi 869
psqaoupyae 0
3008;end=304879b1-d4a1-4ed7-9675-a6ee6c45c3d4;exit=success\echo tjseuznosw $$; media-ctl -d /dev/media0 -V "'rcar_isp fed00000.isp':0 [fmt:RGB888_1X24/1920x1080 field:none]"; echo gzikzpdubp $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo tjseuznosw $$; media-ctl -d /dev/media0 -V "'rcar_isp fed00000.isp':0 [fmt:RGB888_1X24/1920x1080 field:none]"; echo gzikzpdubp $?
3008;start=57e0b86e-ae36-45d7-8820-52b28efca61b;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\tjseuznosw 869
gzikzpdubp 0
3008;end=57e0b86e-ae36-45d7-8820-52b28efca61b;exit=success\echo oqyuoplzrn $$; grep -l 'VIN0 output' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo rxvnjtimjg $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo oqyuoplzrn $$; grep -l 'VIN0 output' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo rxvnjtimjg $?
3008;start=78a50b54-48ad-42aa-8212-38bfe9d38c18;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\oqyuoplzrn 869
/dev/video0
rxvnjtimjg 0
echo rgomvnkmea $$; yavta -f ABGR32 -s 1920x1080 --field none /dev/video0; echo hfdznkarjq $?
3008;end=78a50b54-48ad-42aa-8212-38bfe9d38c18;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo rgomvnkmea $$; yavta -f ABGR32 -s 1920x1080 --field none /dev/video0; echo hfdznkarjq $?
3008;start=d70b55ea-6f97-45f9-82dd-e61575c84f3f;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\rgomvnkmea 869
Device /dev/video0 opened.
Device `R_Car_VIN' on `platform:e6ef0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format set: ABGR32 (34325241) 1920x1080 (stride 7680) field none buffer size 8294400
Video format: ABGR32 (34325241) 1920x1080 (stride 7680) field none buffer size 8294400
hfdznkarjq 0
3008;end=d70b55ea-6f97-45f9-82dd-e61575c84f3f;exit=success\echo rxwnhbcovo $$; grep -l 'max96724 1-0049' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo tvbupouvrv $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo rxwnhbcovo $$; grep -l 'max96724 1-0049' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo tvbupouvrv $?
3008;start=e9066954-06c3-43f3-875e-3d7f7fbb04a9;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\rxwnhbcovo 869
/dev/v4l-subdev2
tvbupouvrv 0
3008;end=e9066954-06c3-43f3-875e-3d7f7fbb04a9;exit=success\echo ulbguytayp $$; yavta --set-control '0x009f0903 0' /dev/v4l-subdev2; echo qmikwbmfup $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo ulbguytayp $$; yavta --set-control '0x009f0903 0' /dev/v4l-subdev2; echo qmikwbmfup $?
3008;start=e273f40b-32cd-46d6-b1da-4ba6b0d7c69d;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\ulbguytayp 869
Device /dev/v4l-subdev2 opened.
Control 0x009f0903 set to 0, is 0
Unable to get format: Inappropriate ioctl for device (25).
qmikwbmfup 0
echo xeiseshqpg $$; yavta -c10 --file=/tmp/vin-capture/checkerboard-ABGR32-1920x1080-#.bin /dev/video0; echo pqgvcmkdto $?
3008;end=e273f40b-32cd-46d6-b1da-4ba6b0d7c69d;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo xeiseshqpg $$; yavta -c10 --file=/tmp/vin-capture/checkerboard-ABGR32-1920x1080-#.bin /dev/video0; echo pqgvcmkdto $?
3008;start=aa309ddb-5405-4252-8943-33a768f3239d;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\xeiseshqpg 869
Device /dev/video0 opened.
Device `R_Car_VIN' on `platform:e6ef0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format: ABGR32 (34325241) 1920x1080 (stride 7680) field none buffer size 8294400
8 buffers requested.
length: 8294400 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffffb7727000.
length: 8294400 offset: 32768 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffffb6f3e000.
length: 8294400 offset: 65536 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffffb6755000.
length: 8294400 offset: 98304 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffffb5f6c000.
length: 8294400 offset: 131072 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffffb5783000.
length: 8294400 offset: 163840 timestamp type/source: mono/EoF
Buffer 5/0 mapped at address 0xffffb4f9a000.
length: 8294400 offset: 196608 timestamp type/source: mono/EoF
Buffer 6/0 mapped at address 0xffffb47b1000.
length: 8294400 offset: 229376 timestamp type/source: mono/EoF
Buffer 7/0 mapped at address 0xffffb3fc8000.
0 (0) [-] none 0 8294400 B 39.617866 39.618829 7.958 fps ts mono/EoF
1 (1) [-] none 1 8294400 B 39.651195 39.658795 30.004 fps ts mono/EoF
2 (2) [-] none 2 8294400 B 39.684516 39.698056 30.011 fps ts mono/EoF
3 (3) [-] none 3 8294400 B 39.717837 39.737152 30.011 fps ts mono/EoF
4 (4) [-] none 4 8294400 B 39.751159 39.776026 30.010 fps ts mono/EoF
5 (5) [-] none 5 8294400 B 39.784478 39.815068 30.013 fps ts mono/EoF
6 (6) [-] none 6 8294400 B 39.817800 39.854007 30.010 fps ts mono/EoF
7 (7) [-] none 7 8294400 B 39.851122 39.893262 30.010 fps ts mono/EoF
8 (0) [-] none 8 8294400 B 39.884444 39.932518 30.010 fps ts mono/EoF
9 (1) [-] none 9 8294400 B 39.917765 39.971624 30.011 fps ts mono/EoF
Captured 10 frames in 0.479421 seconds (20.858463 fps, 173008432.630080 B/s).
8 buffers released.
pqgvcmkdto 0
3008;end=aa309ddb-5405-4252-8943-33a768f3239d;exit=success\echo vddmdvxytp $$; md5sum /tmp/vin-capture/checkerboard-ABGR32-1920x1080-*.bin; echo sglqjsclpb $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo vddmdvxytp $$; md5sum /tmp/vin-capture/checkerboard-ABGR32-1920x1080-*.bin; echo sglqjsclpb $?
3008;start=df8d3269-0df8-44c3-961d-1d148d0cef8b;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\vddmdvxytp 869
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000000.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000001.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000002.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000003.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000004.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000005.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000006.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000007.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000008.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000009.bin
sglqjsclpb 0
echo drrgalvupu $$; yavta --set-control '0x009f0903 1' /dev/v4l-subdev2; echo afdhccbfzl $?
3008;end=df8d3269-0df8-44c3-961d-1d148d0cef8b;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo drrgalvupu $$; yavta --set-control '0x009f0903 1' /dev/v4l-subdev2; echo afdhccbfzl $?
3008;start=6a53da1a-55dc-4f2f-96ab-0664d671d13f;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\drrgalvupu 869
Device /dev/v4l-subdev2 opened.
Control 0x009f0903 set to 1, is 1
Unable to get format: Inappropriate ioctl for device (25).
afdhccbfzl 0
3008;end=6a53da1a-55dc-4f2f-96ab-0664d671d13f;exit=success\echo foheysynzz $$; yavta -c10 --file=/tmp/vin-capture/gradient-ABGR32-1920x1080-#.bin /dev/video0; echo bgcjhzxwgf $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo foheysynzz $$; yavta -c10 --file=/tmp/vin-capture/gradient-ABGR32-1920x1080-#.bin /dev/video0; echo bgcjhzxwgf $?
3008;start=99ce03b0-a9e2-4579-8a9a-9fdce96c85e2;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\foheysynzz 869
Device /dev/video0 opened.
Device `R_Car_VIN' on `platform:e6ef0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format: ABGR32 (34325241) 1920x1080 (stride 7680) field none buffer size 8294400
8 buffers requested.
length: 8294400 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffff827d7000.
length: 8294400 offset: 32768 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffff81fee000.
length: 8294400 offset: 65536 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffff81805000.
length: 8294400 offset: 98304 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffff8101c000.
length: 8294400 offset: 131072 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffff80833000.
length: 8294400 offset: 163840 timestamp type/source: mono/EoF
Buffer 5/0 mapped at address 0xffff8004a000.
length: 8294400 offset: 196608 timestamp type/source: mono/EoF
Buffer 6/0 mapped at address 0xffff7f861000.
length: 8294400 offset: 229376 timestamp type/source: mono/EoF
Buffer 7/0 mapped at address 0xffff7f078000.
0 (0) [-] none 0 8294400 B 41.080545 41.080574 10.829 fps ts mono/EoF
1 (1) [-] none 1 8294400 B 41.113870 41.119683 30.008 fps ts mono/EoF
2 (2) [-] none 2 8294400 B 41.147193 41.158664 30.009 fps ts mono/EoF
3 (3) [-] none 3 8294400 B 41.180514 41.197693 30.011 fps ts mono/EoF
4 (4) [-] none 4 8294400 B 41.213837 41.236586 30.009 fps ts mono/EoF
5 (5) [-] none 5 8294400 B 41.247158 41.275574 30.011 fps ts mono/EoF
6 (6) [-] none 6 8294400 B 41.280477 41.314427 30.013 fps ts mono/EoF
7 (7) [-] none 7 8294400 B 41.313800 41.353399 30.009 fps ts mono/EoF
8 (0) [-] none 8 8294400 B 41.347122 41.392199 30.010 fps ts mono/EoF
9 (1) [-] none 9 8294400 B 41.380442 41.431170 30.012 fps ts mono/EoF
Captured 10 frames in 0.442970 seconds (22.574885 fps, 187245130.107327 B/s).
8 buffers released.
bgcjhzxwgf 0
echo qptbargaid $$; md5sum /tmp/vin-capture/gradient-ABGR32-1920x1080-*.bin; echo btmpwrmobc $?
3008;end=99ce03b0-a9e2-4579-8a9a-9fdce96c85e2;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo qptbargaid $$; md5sum /tmp/vin-capture/gradient-ABGR32-1920x1080-*.bin; echo btmpwrmobc $?
3008;start=b38f56f7-20ae-4793-9f7f-bb6123361939;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\qptbargaid 869
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000000.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000001.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000002.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000003.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000004.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000005.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000006.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000007.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000008.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000009.bin
btmpwrmobc 0
echo edyrkcxyhz $$; media-ctl -d /dev/media0 -r; echo dcyggvwrpz $?
3008;end=b38f56f7-20ae-4793-9f7f-bb6123361939;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo edyrkcxyhz $$; media-ctl -d /dev/media0 -r; echo dcyggvwrpz $?
3008;start=e96d8ee7-9704-4b4b-88a7-6144cddfd804;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\edyrkcxyhz 869
dcyggvwrpz 0
3008;end=e96d8ee7-9704-4b4b-88a7-6144cddfd804;exit=success\echo spjkmqqgev $$; media-ctl -d /dev/media0 --set-routes "'max96724 1-004b' [8/0 -> 4/0 [1]]"; echo xepuwaprop $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo spjkmqqgev $$; media-ctl -d /dev/media0 --set-routes "'max96724 1-004b' [8/0 -> 4/0 [1]]"; echo xepuwaprop $?
3008;start=5a01a8c1-b327-4011-97f0-c461f3073898;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\spjkmqqgev 869
xepuwaprop 0
3008;end=5a01a8c1-b327-4011-97f0-c461f3073898;exit=success\echo pxrquuyvos $$; media-ctl -d /dev/media0 --get-v4l2 "'max96724 1-004b':8"; echo sndeagxpdb $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo pxrquuyvos $$; media-ctl -d /dev/media0 --get-v4l2 "'max96724 1-004b':8"; echo sndeagxpdb $?
3008;start=d641fb37-db46-493e-8afc-f84586dd8e91;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\pxrquuyvos 869
		[stream:0 fmt:RGB888_1X24/640x480]
sndeagxpdb 0
echo aakclhdmys $$; media-ctl -d /dev/media0 -V "'max96724 1-004b':8 [fmt:RGB888_1X24/1920x1080 field:none]"; echo okallpohbq $?
3008;end=d641fb37-db46-493e-8afc-f84586dd8e91;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo aakclhdmys $$; media-ctl -d /dev/media0 -V "'max96724 1-004b':8 [fmt:RGB888_1X24/1920x1080 field:none]"; echo okallpohbq $?
3008;start=67c61c30-f31b-45c2-b92c-939e5a5d0644;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\aakclhdmys 869
okallpohbq 0
3008;end=67c61c30-f31b-45c2-b92c-939e5a5d0644;exit=success\echo tapzranfvz $$; media-ctl -d /dev/media0 -V "'rcar_csi2 fed60000.csi2':0 [fmt:RGB888_1X24/1920x1080 field:none]"; echo nbmaqhpkcn $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo tapzranfvz $$; media-ctl -d /dev/media0 -V "'rcar_csi2 fed60000.csi2':0 [fmt:RGB888_1X24/1920x1080 field:none]"; echo nbmaqhpkcn $?
3008;start=5f64884d-82a8-4c97-a10c-5337c8408582;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\tapzranfvz 869
nbmaqhpkcn 0
3008;end=5f64884d-82a8-4c97-a10c-5337c8408582;exit=success\echo lovleifzfo $$; media-ctl -d /dev/media0 -V "'rcar_isp fed30000.isp':0 [fmt:RGB888_1X24/1920x1080 field:none]"; echo nedmgsmusx $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo lovleifzfo $$; media-ctl -d /dev/media0 -V "'rcar_isp fed30000.isp':0 [fmt:RGB888_1X24/1920x1080 field:none]"; echo nedmgsmusx $?
3008;start=ee9e9db3-bd3a-413d-9a74-00af3105db96;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\lovleifzfo 869
nedmgsmusx 0
3008;end=ee9e9db3-bd3a-413d-9a74-00af3105db96;exit=success\echo pgjnpgvmuu $$; grep -l 'VIN16 output' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo qthlpecfsx $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo pgjnpgvmuu $$; grep -l 'VIN16 output' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo qthlpecfsx $?
3008;start=6bb28673-7e22-4dc5-907a-724726d19ce1;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\pgjnpgvmuu 869
/dev/video8
qthlpecfsx 0
3008;end=6bb28673-7e22-4dc5-907a-724726d19ce1;exit=success\echo rptpyzylgp $$; yavta -f ABGR32 -s 1920x1080 --field none /dev/video8; echo ijrlkozwdz $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo rptpyzylgp $$; yavta -f ABGR32 -s 1920x1080 --field none /dev/video8; echo ijrlkozwdz $?
3008;start=394c3133-04fe-4ed8-8c52-8b08513646c6;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\rptpyzylgp 869
Device /dev/video8 opened.
Device `R_Car_VIN' on `platform:e6ed0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format set: ABGR32 (34325241) 1920x1080 (stride 7680) field none buffer size 8294400
Video format: ABGR32 (34325241) 1920x1080 (stride 7680) field none buffer size 8294400
ijrlkozwdz 0
3008;end=394c3133-04fe-4ed8-8c52-8b08513646c6;exit=success\echo grdnkpntqj $$; grep -l 'max96724 1-004b' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo eouuybcgbn $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo grdnkpntqj $$; grep -l 'max96724 1-004b' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo eouuybcgbn $?
3008;start=295f7937-7db9-4726-a9bc-10a01a619df3;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\grdnkpntqj 869
/dev/v4l-subdev5
eouuybcgbn 0
3008;end=295f7937-7db9-4726-a9bc-10a01a619df3;exit=success\echo mwnldglbst $$; yavta --set-control '0x009f0903 0' /dev/v4l-subdev5; echo pggagilaop $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo mwnldglbst $$; yavta --set-control '0x009f0903 0' /dev/v4l-subdev5; echo pggagilaop $?
3008;start=1ea79791-3905-45e3-8cd9-49b0276130d8;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\mwnldglbst 869
Device /dev/v4l-subdev5 opened.
Control 0x009f0903 set to 0, is 0
Unable to get format: Inappropriate ioctl for device (25).
pggagilaop 0
echo boxypjyzij $$; yavta -c10 --file=/tmp/vin-capture/checkerboard-ABGR32-1920x1080-#.bin /dev/video8; echo emcpgaejag $?
3008;end=1ea79791-3905-45e3-8cd9-49b0276130d8;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo boxypjyzij $$; yavta -c10 --file=/tmp/vin-capture/checkerboard-ABGR32-1920x1080-#.bin /dev/video8; echo emcpgaejag $?
3008;start=b98b1285-0c83-4c57-b949-efffacf3a0b6;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\boxypjyzij 869
Device /dev/video8 opened.
Device `R_Car_VIN' on `platform:e6ed0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format: ABGR32 (34325241) 1920x1080 (stride 7680) field none buffer size 8294400
8 buffers requested.
length: 8294400 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffffa3cd7000.
length: 8294400 offset: 32768 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffffa34ee000.
length: 8294400 offset: 65536 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffffa2d05000.
length: 8294400 offset: 98304 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffffa251c000.
length: 8294400 offset: 131072 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffffa1d33000.
length: 8294400 offset: 163840 timestamp type/source: mono/EoF
Buffer 5/0 mapped at address 0xffffa154a000.
length: 8294400 offset: 196608 timestamp type/source: mono/EoF
Buffer 6/0 mapped at address 0xffffa0d61000.
length: 8294400 offset: 229376 timestamp type/source: mono/EoF
Buffer 7/0 mapped at address 0xffffa0578000.
0 (0) [-] none 0 8294400 B 43.604035 43.604066 7.957 fps ts mono/EoF
1 (1) [-] none 1 8294400 B 43.637363 43.648104 30.005 fps ts mono/EoF
2 (2) [-] none 2 8294400 B 43.670685 43.691536 30.010 fps ts mono/EoF
3 (3) [-] none 3 8294400 B 43.704005 43.734981 30.012 fps ts mono/EoF
4 (4) [-] none 4 8294400 B 43.737326 43.810144 30.011 fps ts mono/EoF
5 (5) [-] none 5 8294400 B 43.770650 43.854021 30.008 fps ts mono/EoF
6 (6) [-] none 6 8294400 B 43.803972 43.897371 30.010 fps ts mono/EoF
7 (7) [-] none 7 8294400 B 43.837292 43.940990 30.012 fps ts mono/EoF
8 (0) [-] none 8 8294400 B 43.870613 43.984158 30.011 fps ts mono/EoF
9 (1) [-] none 9 8294400 B 43.903932 44.027508 30.013 fps ts mono/EoF
Captured 10 frames in 0.549155 seconds (18.209794 fps, 151039319.376736 B/s).
8 buffers released.
emcpgaejag 0
echo byvthakmop $$; md5sum /tmp/vin-capture/checkerboard-ABGR32-1920x1080-*.bin; echo frbehbovau $?
3008;end=b98b1285-0c83-4c57-b949-efffacf3a0b6;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo byvthakmop $$; md5sum /tmp/vin-capture/checkerboard-ABGR32-1920x1080-*.bin; echo frbehbovau $?
3008;start=169c0bc8-5abb-4c6c-9715-e504a599de8e;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\byvthakmop 869
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000000.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000001.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000002.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000003.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000004.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000005.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000006.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000007.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000008.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000009.bin
frbehbovau 0
echo uibuhhmhgg $$; yavta --set-control '0x009f0903 1' /dev/v4l-subdev5; echo cwkqxpwtat $?
3008;end=169c0bc8-5abb-4c6c-9715-e504a599de8e;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo uibuhhmhgg $$; yavta --set-control '0x009f0903 1' /dev/v4l-subdev5; echo cwkqxpwtat $?
3008;start=752be5e8-41e9-46a8-9088-47d8eacd56ba;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\uibuhhmhgg 869
Device /dev/v4l-subdev5 opened.
Control 0x009f0903 set to 1, is 1
Unable to get format: Inappropriate ioctl for device (25).
cwkqxpwtat 0
3008;end=752be5e8-41e9-46a8-9088-47d8eacd56ba;exit=success\echo tnvrsobydy $$; yavta -c10 --file=/tmp/vin-capture/gradient-ABGR32-1920x1080-#.bin /dev/video8; echo aojkkhltmw $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo tnvrsobydy $$; yavta -c10 --file=/tmp/vin-capture/gradient-ABGR32-1920x1080-#.bin /dev/video8; echo aojkkhltmw $?
3008;start=3cbf987e-3a76-437d-84ca-06b933bdf750;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\tnvrsobydy 869
Device /dev/video8 opened.
Device `R_Car_VIN' on `platform:e6ed0000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format: ABGR32 (34325241) 1920x1080 (stride 7680) field none buffer size 8294400
8 buffers requested.
length: 8294400 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffffaf3d7000.
length: 8294400 offset: 32768 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffffaebee000.
length: 8294400 offset: 65536 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffffae405000.
length: 8294400 offset: 98304 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffffadc1c000.
length: 8294400 offset: 131072 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffffad433000.
length: 8294400 offset: 163840 timestamp type/source: mono/EoF
Buffer 5/0 mapped at address 0xffffacc4a000.
length: 8294400 offset: 196608 timestamp type/source: mono/EoF
Buffer 6/0 mapped at address 0xffffac461000.
length: 8294400 offset: 229376 timestamp type/source: mono/EoF
Buffer 7/0 mapped at address 0xffffabc78000.
0 (0) [-] none 0 8294400 B 45.187186 45.187214 6.290 fps ts mono/EoF
1 (1) [-] none 1 8294400 B 45.220513 45.230681 30.006 fps ts mono/EoF
2 (2) [-] none 2 8294400 B 45.253835 45.273934 30.010 fps ts mono/EoF
3 (3) [-] none 3 8294400 B 45.287156 45.317196 30.011 fps ts mono/EoF
4 (4) [-] none 4 8294400 B 45.320480 45.360473 30.008 fps ts mono/EoF
5 (5) [-] none 5 8294400 B 45.353799 45.403996 30.013 fps ts mono/EoF
6 (6) [-] none 6 8294400 B 45.387121 45.447173 30.010 fps ts mono/EoF
7 (7) [-] none 7 8294400 B 45.420441 45.490448 30.012 fps ts mono/EoF
8 (0) [-] none 8 8294400 B 45.453761 45.533625 30.012 fps ts mono/EoF
9 (1) [-] none 9 8294400 B 45.487083 45.577015 30.010 fps ts mono/EoF
Captured 10 frames in 0.548817 seconds (18.220987 fps, 151132152.998215 B/s).
8 buffers released.
aojkkhltmw 0
echo egjgpccvxr $$; md5sum /tmp/vin-capture/gradient-ABGR32-1920x1080-*.bin; echo ozrcekonfn $?
3008;end=3cbf987e-3a76-437d-84ca-06b933bdf750;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo egjgpccvxr $$; md5sum /tmp/vin-capture/gradient-ABGR32-1920x1080-*.bin; echo ozrcekonfn $?
3008;start=e89955ab-9718-400f-a798-a1a1e392c80e;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\egjgpccvxr 869
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000000.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000001.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000002.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000003.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000004.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000005.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000006.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000007.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000008.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000009.bin
ozrcekonfn 0
echo mxsufjbeia $$; media-ctl -d /dev/media0 -r; echo xqnmfionla $?
3008;end=e89955ab-9718-400f-a798-a1a1e392c80e;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo mxsufjbeia $$; media-ctl -d /dev/media0 -r; echo xqnmfionla $?
3008;start=bee0a639-75a2-4d06-ad2a-474c3951be94;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\mxsufjbeia 869
xqnmfionla 0
3008;end=bee0a639-75a2-4d06-ad2a-474c3951be94;exit=success\echo peplntulyo $$; media-ctl -d /dev/media0 --set-routes "'max96724 1-006b' [8/0 -> 4/0 [1]]"; echo mahrpafojy $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo peplntulyo $$; media-ctl -d /dev/media0 --set-routes "'max96724 1-006b' [8/0 -> 4/0 [1]]"; echo mahrpafojy $?
3008;start=0ed09528-c6b2-423b-9c67-fa42626582bc;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\peplntulyo 869
mahrpafojy 0
3008;end=0ed09528-c6b2-423b-9c67-fa42626582bc;exit=success\echo xaepuacddn $$; media-ctl -d /dev/media0 --get-v4l2 "'max96724 1-006b':8"; echo dfqpxyulcy $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo xaepuacddn $$; media-ctl -d /dev/media0 --get-v4l2 "'max96724 1-006b':8"; echo dfqpxyulcy $?
3008;start=0866cc8c-0d2f-4e9d-9d25-93d6b7a8a249;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\xaepuacddn 869
		[stream:0 fmt:RGB888_1X24/640x480]
dfqpxyulcy 0
3008;end=0866cc8c-0d2f-4e9d-9d25-93d6b7a8a249;exit=success\echo antuahayec $$; media-ctl -d /dev/media0 -V "'max96724 1-006b':8 [fmt:RGB888_1X24/1920x1080 field:none]"; echo azbpkheacn $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo antuahayec $$; media-ctl -d /dev/media0 -V "'max96724 1-006b':8 [fmt:RGB888_1X24/1920x1080 field:none]"; echo azbpkheacn $?
3008;start=90df5e3c-78f0-412e-b447-2450bb24f24e;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\antuahayec 869
azbpkheacn 0
3008;end=90df5e3c-78f0-412e-b447-2450bb24f24e;exit=success\echo ecgydajihu $$; media-ctl -d /dev/media0 -V "'rcar_csi2 fed70000.csi2':0 [fmt:RGB888_1X24/1920x1080 field:none]"; echo pjiqjqsrci $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo ecgydajihu $$; media-ctl -d /dev/media0 -V "'rcar_csi2 fed70000.csi2':0 [fmt:RGB888_1X24/1920x1080 field:none]"; echo pjiqjqsrci $?
3008;start=3962247f-ac37-4c8a-8916-5eb85cd3a6b6;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\ecgydajihu 869
pjiqjqsrci 0
3008;end=3962247f-ac37-4c8a-8916-5eb85cd3a6b6;exit=success\echo mkpzufbslb $$; media-ctl -d /dev/media0 -V "'rcar_isp fed40000.isp':0 [fmt:RGB888_1X24/1920x1080 field:none]"; echo oqmviqjzko $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo mkpzufbslb $$; media-ctl -d /dev/media0 -V "'rcar_isp fed40000.isp':0 [fmt:RGB888_1X24/1920x1080 field:none]"; echo oqmviqjzko $?
3008;start=4340d926-e4b4-498e-b1a7-b7304afaa0fe;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\mkpzufbslb 869
oqmviqjzko 0
3008;end=4340d926-e4b4-498e-b1a7-b7304afaa0fe;exit=success\echo lzjkflieff $$; grep -l 'VIN24 output' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo xlqvfmpisj $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo lzjkflieff $$; grep -l 'VIN24 output' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo xlqvfmpisj $?
3008;start=03d2938e-3203-4ded-8a46-d3b422cfba5e;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\lzjkflieff 869
/dev/video16
xlqvfmpisj 0
3008;end=03d2938e-3203-4ded-8a46-d3b422cfba5e;exit=success\echo pqecpxhzcg $$; yavta -f ABGR32 -s 1920x1080 --field none /dev/video16; echo sdrnkkwyzt $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo pqecpxhzcg $$; yavta -f ABGR32 -s 1920x1080 --field none /dev/video16; echo sdrnkkwyzt $?
3008;start=263af513-1d8e-4a52-922a-5cd53f8bf1c2;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\pqecpxhzcg 869
Device /dev/video16 opened.
Device `R_Car_VIN' on `platform:e6ed8000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format set: ABGR32 (34325241) 1920x1080 (stride 7680) field none buffer size 8294400
Video format: ABGR32 (34325241) 1920x1080 (stride 7680) field none buffer size 8294400
sdrnkkwyzt 0
echo obcwrrisdf $$; grep -l 'max96724 1-006b' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo jslxrqvgvz $?
3008;end=263af513-1d8e-4a52-922a-5cd53f8bf1c2;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo obcwrrisdf $$; grep -l 'max96724 1-006b' /sys/class/video4linux/*/name | sed 's#.*video4linux\(.*\)/name#/dev\1#g'; echo jslxrqvgvz $?
3008;start=3ba5dc1b-44f0-4c54-81cd-978c1fa76dbb;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\obcwrrisdf 869
/dev/v4l-subdev8
jslxrqvgvz 0
echo ndwahmzhox $$; yavta --set-control '0x009f0903 0' /dev/v4l-subdev8; echo fdnqhwxudn $?
3008;end=3ba5dc1b-44f0-4c54-81cd-978c1fa76dbb;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo ndwahmzhox $$; yavta --set-control '0x009f0903 0' /dev/v4l-subdev8; echo fdnqhwxudn $?
3008;start=86c9e4d7-9c4e-4d8a-acbd-d9c9d8589b79;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\ndwahmzhox 869
Device /dev/v4l-subdev8 opened.
Control 0x009f0903 set to 0, is 0
Unable to get format: Inappropriate ioctl for device (25).
fdnqhwxudn 0
echo pqdijodbsn $$; yavta -c10 --file=/tmp/vin-capture/checkerboard-ABGR32-1920x1080-#.bin /dev/video16; echo dweugkrxua $?
3008;end=86c9e4d7-9c4e-4d8a-acbd-d9c9d8589b79;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo pqdijodbsn $$; yavta -c10 --file=/tmp/vin-capture/checkerboard-ABGR32-1920x1080-#.bin /dev/video16; echo dweugkrxua $?
3008;start=4471629a-2eac-4add-ad2c-357a8c3b3898;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\pqdijodbsn 869
Device /dev/video16 opened.
Device `R_Car_VIN' on `platform:e6ed8000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format: ABGR32 (34325241) 1920x1080 (stride 7680) field none buffer size 8294400
8 buffers requested.
length: 8294400 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffffb1a07000.
length: 8294400 offset: 32768 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffffb121e000.
length: 8294400 offset: 65536 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffffb0a35000.
length: 8294400 offset: 98304 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffffb024c000.
length: 8294400 offset: 131072 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffffafa63000.
length: 8294400 offset: 163840 timestamp type/source: mono/EoF
Buffer 5/0 mapped at address 0xffffaf27a000.
length: 8294400 offset: 196608 timestamp type/source: mono/EoF
Buffer 6/0 mapped at address 0xffffaea91000.
length: 8294400 offset: 229376 timestamp type/source: mono/EoF
Buffer 7/0 mapped at address 0xffffae2a8000.
0 (0) [-] none 0 8294400 B 47.753871 47.753901 7.957 fps ts mono/EoF
1 (1) [-] none 1 8294400 B 47.787201 47.797971 30.003 fps ts mono/EoF
2 (2) [-] none 2 8294400 B 47.820519 47.841285 30.014 fps ts mono/EoF
3 (3) [-] none 3 8294400 B 47.853840 47.884649 30.011 fps ts mono/EoF
4 (4) [-] none 4 8294400 B 47.887165 47.927912 30.008 fps ts mono/EoF
5 (5) [-] none 5 8294400 B 47.920483 47.971634 30.014 fps ts mono/EoF
6 (6) [-] none 6 8294400 B 47.953805 48.014831 30.010 fps ts mono/EoF
7 (7) [-] none 7 8294400 B 47.987126 48.058164 30.011 fps ts mono/EoF
8 (0) [-] none 8 8294400 B 48.020445 48.101361 30.013 fps ts mono/EoF
9 (1) [-] none 9 8294400 B 48.053767 48.147725 30.010 fps ts mono/EoF
Captured 10 frames in 0.519522 seconds (19.248433 fps, 159654200.212627 B/s).
8 buffers released.
dweugkrxua 0
echo yencwszpqj $$; md5sum /tmp/vin-capture/checkerboard-ABGR32-1920x1080-*.bin; echo gyaexftqht $?
3008;end=4471629a-2eac-4add-ad2c-357a8c3b3898;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo yencwszpqj $$; md5sum /tmp/vin-capture/checkerboard-ABGR32-1920x1080-*.bin; echo gyaexftqht $?
3008;start=d07e9674-dc4c-47be-853c-1325a74a0cbf;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\yencwszpqj 869
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000000.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000001.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000002.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000003.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000004.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000005.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000006.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000007.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000008.bin
21d0f33966148e2ed1089ed1ddb76415  /tmp/vin-capture/checkerboard-ABGR32-1920x1080-000009.bin
gyaexftqht 0
echo jzszdgdahc $$; yavta --set-control '0x009f0903 1' /dev/v4l-subdev8; echo eknkjnjwdq $?
3008;end=d07e9674-dc4c-47be-853c-1325a74a0cbf;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo jzszdgdahc $$; yavta --set-control '0x009f0903 1' /dev/v4l-subdev8; echo eknkjnjwdq $?
3008;start=511cee07-52f0-414c-8bdb-80c8c2587019;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\jzszdgdahc 869
Device /dev/v4l-subdev8 opened.
Control 0x009f0903 set to 1, is 1
Unable to get format: Inappropriate ioctl for device (25).
eknkjnjwdq 0
3008;end=511cee07-52f0-414c-8bdb-80c8c2587019;exit=success\echo eqkvnbdvca $$; yavta -c10 --file=/tmp/vin-capture/gradient-ABGR32-1920x1080-#.bin /dev/video16; echo itzpioorze $?
3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo eqkvnbdvca $$; yavta -c10 --file=/tmp/vin-capture/gradient-ABGR32-1920x1080-#.bin /dev/video16; echo itzpioorze $?
3008;start=5a3aca1e-4a5e-4a05-ab61-666041fa3a48;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\eqkvnbdvca 869
Device /dev/video16 opened.
Device `R_Car_VIN' on `platform:e6ed8000.video' (driver 'rcar_vin') supports video, capture, without mplanes.
Video format: ABGR32 (34325241) 1920x1080 (stride 7680) field none buffer size 8294400
8 buffers requested.
length: 8294400 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffffb67e7000.
length: 8294400 offset: 32768 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffffb5ffe000.
length: 8294400 offset: 65536 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffffb5815000.
length: 8294400 offset: 98304 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffffb502c000.
length: 8294400 offset: 131072 timestamp type/source: mono/EoF
Buffer 4/0 mapped at address 0xffffb4843000.
length: 8294400 offset: 163840 timestamp type/source: mono/EoF
Buffer 5/0 mapped at address 0xffffb405a000.
length: 8294400 offset: 196608 timestamp type/source: mono/EoF
Buffer 6/0 mapped at address 0xffffb3871000.
length: 8294400 offset: 229376 timestamp type/source: mono/EoF
Buffer 7/0 mapped at address 0xffffb3088000.
0 (0) [-] none 0 8294400 B 49.253865 49.253896 7.957 fps ts mono/EoF
1 (1) [-] none 1 8294400 B 49.287193 49.297443 30.005 fps ts mono/EoF
2 (2) [-] none 2 8294400 B 49.320514 49.340764 30.011 fps ts mono/EoF
3 (3) [-] none 3 8294400 B 49.353837 49.384168 30.009 fps ts mono/EoF
4 (4) [-] none 4 8294400 B 49.387159 49.427651 30.010 fps ts mono/EoF
5 (5) [-] none 5 8294400 B 49.420478 49.470970 30.013 fps ts mono/EoF
6 (6) [-] none 6 8294400 B 49.453799 49.514182 30.011 fps ts mono/EoF
7 (7) [-] none 7 8294400 B 49.487119 49.557384 30.012 fps ts mono/EoF
8 (0) [-] none 8 8294400 B 49.520440 49.600586 30.011 fps ts mono/EoF
9 (1) [-] none 9 8294400 B 49.553761 49.643898 30.011 fps ts mono/EoF
Captured 10 frames in 0.515703 seconds (19.390981 fps, 160836549.552079 B/s).
8 buffers released.
itzpioorze 0
echo szbpxungio $$; md5sum /tmp/vin-capture/gradient-ABGR32-1920x1080-*.bin; echo pejjkaeplb $?
3008;end=5a3aca1e-4a5e-4a05-ab61-666041fa3a48;exit=success\3008;start=65ca0a45-1b47-4b5e-b526-b87e9c21d0a0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=shell;cwd=/root\01marm64 ~ # echo szbpxungio $$; md5sum /tmp/vin-capture/gradient-ABGR32-1920x1080-*.bin; echo pejjkaeplb $?
3008;start=7169b0cb-def8-44f4-b848-2a6dccfd7ba0;machineid=f96e3a8d3dfd4be8bd719d9170779065;user=root;hostname=arm64;bootid=8006fc6b-2089-49a1-a726-f3127b64340f;pid=869;type=command;cwd=/root\szbpxungio 869
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000000.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000001.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000002.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000003.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000004.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000005.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000006.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000007.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000008.bin
f409c6fd3912b1b1b830d9661a83f3f7  /tmp/vin-capture/gradient-ABGR32-1920x1080-000009.bin
pejjkaeplb 0
exit

--mKYtYBfWo49ZJWkq--
