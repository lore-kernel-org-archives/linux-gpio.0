Received: from mail-wm2-f8.google.com (mail-wm2-f8.google.com [74.125.225.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA7841D125
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 10:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801277; cv=none; b=czPa37q9vah1xUxYZmEVi7Nxg6m/FpNwN0xeaQ9asqGElIwkIm35IU4XmnYQWgazJud00e41XoI1dTTXr8gvKVqdpyqITKrMjkN5S1B+JoNrmrhYkvmNfDOXqi8AdsKJYe53Pbm+NXnqlHyCqduXGp2sdajNJRRoid08at0UNxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801277; c=relaxed/simple;
	bh=qPE1Fr7D2oTtJwhgrsWehdR9toNeK1V5anzNUe9deV8=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:
	 References:Subject; b=mYy8FsGDcK4qy9+vyZWOYJ2khTrS6AqY/2xN69EFwFsXK9DNrhnHJ1L8rvKwZewnxOTIFCK4ys8OqTYCW9QMokU4WfmFuZLdIoO8kBhmcOpHJ2quFqROfM5bJLfG/zEPsVXLWVaW3Wxs8Ej/Iq3QMxEO3dVvo8VOThJbNj0o03Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dh3xyWtc; arc=none smtp.client-ip=74.125.225.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dh3xyWtc"
Received: by mail-wm2-f8.google.com with SMTP id 5b1f17b1804b1-4955743600cso296415e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 03:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784801273; x=1785406073; darn=vger.kernel.org;
        h=subject:references:in-reply-to:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPE1Fr7D2oTtJwhgrsWehdR9toNeK1V5anzNUe9deV8=;
        b=Dh3xyWtcWcOpNK790vmpX9OHeOZh2VrjObTBkv31ALqKaGtMfBD39hFebTHTX/a8eq
         3TwlpD/tXOTxJQRxiS11V6yfuzjrQfo85H+J0TuEdlZVuKpXU6JVnVnSQ2/VLvwjO61u
         6/+Au7tv8nbwiNE+uL2n9yPUQd3g5h+UpCpdkuyb58HUnZymAWezH4d4woAkv9baV+l1
         9zfuf7ILrmp4QYNaX6DhZplq39BhZPvhp3rtQrLfyzmm5HeD9H7MZbGKhn201omZ7Deq
         04vzg188VG3mBdnmuvfr2ENsp1dKYGK1LCeU3vIdBr5P+12b0RZcuIu+wvkoZFFShDYk
         2UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801273; x=1785406073;
        h=subject:references:in-reply-to:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPE1Fr7D2oTtJwhgrsWehdR9toNeK1V5anzNUe9deV8=;
        b=BVDhIYRX+4iVBc2PWywI0e0Y3rDKUTSn/vnKNgLuxhdzK7kGCI4YebJ9DdVKOTR+G2
         eWEFe+48lkqN5L8M0g2n4Xc0MK4P3xKbzbjsKcoYU6p4JIFTFpUswVapknkghYM3+Won
         +2XwILOn4FbubBOGc2qPQTkIMdknhLtyS1TviaOLBLVaQ4pw+FcDRDI5VaBFjD/eNJOw
         08iViM67dFA5ECT997dG9wgfUwsplciWWTikfSMy66KunVFoO1zovk5BT+D8i3ukePD4
         BAEYqNVsfBJRS0O6BOE6+KbuYYqYFENBBVl0z1VpyuvQe6a67g39qRsAgFyuiPcKYlfD
         DxvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqnzRdOvMvTNy04qZeWEIKnzSOkrF71kuULoEZl7yBzd66RliMp6dZWRQA2V6jACwS3Z9uSyzbKAsaw@vger.kernel.org
X-Gm-Message-State: AOJu0YzfAuDy31m155GXWOctEtU/+72OygvAsldn9r/du7f2bjAEiHXk
	+LwUADu24Md79jqDgWY46NFoYKrgGaWp0rZJHwL40OaA3p4i5QCpDJuYyei0FyeM
X-Gm-Gg: AR+sD12eD3St+6o5oHPkqj14Jnisn6w436oslBRget/wHYU+aK1faZ1l2TRogE6v2D+
	u6n9ZR0qEA2OJ29c/WMUWK1pXM1ytEBUDO2K9YxG+5Z13kAaMxSuUvHYXP7f+TnMdpRpJmDrgDq
	1xQMMRbovPXXRZivatP+U4wVlUQMJsAR9p1G7dIY8YWAn5DJFT/hpR9eoVg4OD+z4m3ASn/76j9
	YSikpV27JMtafMnveLDb9I6loLrJzdZYs7UKLaiCcy9RtJANjuDA5Qv2pLvQocI1XlVNSCcOT+G
	rqMD7FW4Y4AlaR6UFecudnKgGpu4eXmr9dHRebrAcTyrzMHQZRkZ1bSjJ6DvZxraiIQwIUtrwg7
	9u97W5G0LGTaD2r4X2VB2+kS+DXKdWnSTN7FI6iPcwABHWXQNaxcUabOtls78xHGm0PrmEnWgfO
	ekTjdbJ62kqXcc/Jw=
X-Received: by 2002:a05:600c:5715:b0:495:4044:11fc with SMTP id 5b1f17b1804b1-49573cf0130mr10416385e9.7.1784801273183;
        Thu, 23 Jul 2026 03:07:53 -0700 (PDT)
Received: from [127.0.1.1] ([79.123.179.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956537c6besm197711895e9.8.2026.07.23.03.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:07:52 -0700 (PDT)
Message-ID: <6a61e7f8.e11288f4.4669c.c3b1@mx.google.com>
Date: Thu, 23 Jul 2026 03:07:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: =?utf-8?q?Metehan_G=C3=BCnen?= <metehangnen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-gpio@vger.kernel.org
In-Reply-To: <2026071842-timing-distress-ad5a@gregkh>
References: <2026071842-timing-distress-ad5a@gregkh>
Subject: =?utf-8?q?Re=3A_=5BPATCH_0/4=5D_drivers/misc=3A_add_Goodix_GXFP5130_eSPI_fin?=
 =?utf-8?q?gerprint_sensor_driver?=

SSBhbSB3aXRoZHJhd2luZyB0aGlzIHBhdGNoIHNlcmllcyAodjEpLgoKQWZ0ZXIgY29uc3VsdGlu
ZyB3aXRoIFZvaWQ3NTUsIHdobyB3cm90ZSB0aGUgb3JpZ2luYWwgb3V0LW9mLXRyZWUgZHJpdmVy
CnRoaXMgc3VibWlzc2lvbiB3YXMgYmFzZWQgb24sIGl0IGJlY2FtZSBjbGVhciB0aGF0IHRoZSBk
cml2ZXIgaXMgbm90IHJlYWR5CmZvciBtYWlubGluZSBpbmNsdXNpb24geWV0LiBTcGVjaWZpY2Fs
bHk6CgogIC0gVGhlIGtlcm5lbCBtb2R1bGUgY3VycmVudGx5IGhhbmRsZXMgc2Vuc29yLXNwZWNp
ZmljIHByb3RvY29sIGxvZ2ljCiAgICAoTVAgcHJvdG9jb2wsIEdvb2RpeCBjb21tYW5kIHN0cnVj
dHVyZXMpIHRoYXQgYmVsb25ncyBpbiB1c2Vyc3BhY2UuCiAgICBUaGlzIGlzIGNvbnNpc3RlbnQg
d2l0aCB0aGUgY29uY2VybiB5b3UgcmFpc2VkIGFib3V0IHdoeSBhIGtlcm5lbAogICAgZHJpdmVy
IGlzIG5lZWRlZCBhdCBhbGwuCgogIC0gQSBzaWJsaW5nIHNlbnNvciAoU0lMNjI1MCkgc2hhcmVz
IHRoZSBzYW1lIGVTUEkgbWFpbGJveCB0cmFuc3BvcnQKICAgIG1lY2hhbmlzbS4gQSBwcm9wZXJs
eSByZWZhY3RvcmVkLCB0cmFuc3BvcnQtb25seSBrZXJuZWwgZHJpdmVyIGNvdWxkCiAgICBzdXBw
b3J0IGJvdGggc2Vuc29ycywgd2hpY2ggd291bGQgbWFrZSBhIHN0cm9uZ2VyIGNhc2UgZm9yIG1h
aW5saW5lLgoKICAtIFRoZSBvcmlnaW5hbCBhdXRob3IgcHJlZmVycyBvdXQtb2YtdHJlZSBtYWlu
dGVuYW5jZSBmb3Igbm93IHdoaWxlCiAgICB0aGUgYXJjaGl0ZWN0dXJlIGlzIHJld29ya2VkLgoK
SSB3aWxsIHJlc3VibWl0IG9uY2UgdGhlIGtlcm5lbC91c2Vyc3BhY2UgYm91bmRhcnkgaXMgcHJv
cGVybHkgZGVzaWduZWQKYW5kIHRoZSBkcml2ZXIgaXMgaW4gYSBzdGF0ZSB0aGUgb3JpZ2luYWwg
YXV0aG9yIGNvbnNpZGVycyByZWFkeS4KClRoYW5rIHlvdSBmb3IgdGhlIGRldGFpbGVkIHJldmll
dyBvZiB2MS4KCk1ldGVoYW4gR8O8bmVu

