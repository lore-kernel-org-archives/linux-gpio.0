Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D191F38642A
	for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 10:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784458391; cv=none; b=srkmFJnrZCR2wiEqQDSwDwKtFi1sYPPT7ZLLNXPviIg2mwgm5mit5CMYAGP3emJ0wlC8/1WkHnEh+KR9bFl5iEv3qmPHa0NjPuXIPx65xZ6Y+ZdUnZxSLDD0bfuf0AWW6CQFnQCxRDyv/oxgejqtECBy2w2Plcv0cIjc60bjEjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784458391; c=relaxed/simple;
	bh=/5stKGTjM8RDf33Hi3oAICL3kCNtUXBZoRIxwYgqcTE=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:
	 References:Subject; b=vCR3v90VmLkL4zwaOEqmS9bGe82cdKTV8N6Ue4fNEyG9UAGaRTjX0C7cbUpUORtcwu+DtzC+/IUpY1D7GNwVpzIKAeeTxl+/0f7o3sonZxLiH+KOpVSp4WL9K1NED2EfhcN59kKkfeWN7d7IUR+8PON7WkNhwINtES4oSKo90XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeCBvS5r; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeCBvS5r"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4953d14da07so1605725e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 03:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784458388; x=1785063188; darn=vger.kernel.org;
        h=subject:references:in-reply-to:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5stKGTjM8RDf33Hi3oAICL3kCNtUXBZoRIxwYgqcTE=;
        b=WeCBvS5riXPzF+0eROVvc2FVbcev59mw5/6CTIOWx8vAIuKUD0ldWyvChTR3xhydtN
         A0I9lUSisS7aQYpK2oqjWmEYNf5EBQvbJM7xq0MZ8kUrcR+GQSzBw/mvJ130dY3eHHFb
         j2JCOkliFWjYylIJt2IZWc9N0QqNjk5TPxS9QUqAIbymw6sLRRAGr86Si4pPeNKGJQjL
         pkPFAA9qm6ztYOfiQyrxORiaakgfkQaGBqpmTLbhjT5tl64Yr426CVrG7RWSpC+PXG25
         FshIC6mwmEMiRTczxzhmDAYZdj/c7O+J/xqDozwhytcT5QXGJceBPBjbKDzPvp4NYxCu
         +khQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784458388; x=1785063188;
        h=subject:references:in-reply-to:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/5stKGTjM8RDf33Hi3oAICL3kCNtUXBZoRIxwYgqcTE=;
        b=tPQCjhxbWECdQ5qHLn2FexEzBBSzUW4lZfjyotV/pJ/GmCZdhNeq/s70CkseAM8z7P
         N/71LOyqYwbFhNTX6lFXXj/WXH/8+awAT5Xik0T6sHK+d11GcOPFOg2TeiX85bpvl+Or
         Ln6Zv0Pd5ZTY1edH9i1BDFvA2rnC88r5wR/9RojCree1os1TPkQv2bZQLr5AKFmuTaL9
         8kgtF8xnYgdxwQE1ASsyWM90x5aq+PIhY7hkUi/NV4MRP4XSt9yRsISFNLgBujepg00R
         gocfGdmWaEYlBZECITaUx+Mh7XWbcYOk3e9drLnWyVaWPNv/y6L51F8Mwmb814jCptYi
         Zhjw==
X-Forwarded-Encrypted: i=1; AHgh+Rom4lNYR1p4hCET1Vcn/Yni+Tf0ZqU1TuJuDIOJuq6JejDBw087dSttK3dA8kjI9K7AeMuWKyEyne0b@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz8ZF7VxoWF9ZKsH6WbA+0BxH/Z0QCIZZu+TfzgxkVDNsidp8A
	D24NKqzHzwlIOLEeHtNjyL4nEIYbWjXFUUtaD1ow4GoIIweqi50mGp7dk61Gu6Vh
X-Gm-Gg: AfdE7cnXF5MYf1sTvG9BR3Y5B9wXKaXYx4xYeJRHGqaqNDSpkeOwVUUXleakci6L3St
	Xy5Bl5EvbG362mfOC1FgGIHyF54e//YLiOK8oiTIKLRThMKjhILcnFvhhfNXCFp80s56BvGb7BE
	UjYjDxvfg6BILpK7ZUdZcS6ddRb4Kkok5QSOyjZnOS2TQ29L/FtdNVsQS2p53RksIhRQvBszxkc
	B6uOTT4qj3zJ4XFLU3Rxce6PlmoGJPD0FQg9doXGpJkmwULLt4F3f9yQKSFpp2N5+1olohqPAVL
	iwKe4zNDx7jpTCwYvRtpJrwRekY8u7QXVlEFAwxOoTgQnRAHB9xQ/eoeQrdyIM1HaHZOJEOXLxz
	Vcv5dvkfySC2podx+0svhns08PT4SBGrHGhnxinHg0vY0C/tP3S/NHjTeYIj1MjIJimevyxeGSF
	Cg+e4=
X-Received: by 2002:a05:600d:84ca:20b0:493:f965:2b85 with SMTP id 5b1f17b1804b1-4954a515a63mr41725415e9.4.1784458387717;
        Sun, 19 Jul 2026 03:53:07 -0700 (PDT)
Received: from [127.0.1.1] ([95.70.199.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49548e075d4sm141919705e9.1.2026.07.19.03.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 03:53:06 -0700 (PDT)
Message-ID: <6a5cac92.b39440a8.65068.278c@mx.google.com>
Date: Sun, 19 Jul 2026 03:53:06 -0700 (PDT)
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

T24gU2F0LCBKdWwgMTgsIDIwMjYgYXQgMTE6MDU6MzBBTSArMDIwMCwgR3JlZyBLSCB3cm90ZToK
PiBJcyB0aGF0IHRoZSAibm9ybWFsIiB1c2VyL2tlcm5lbCBhcGkgZm9yIHRoZXNlIHR5cGVzIG9m
IHNlbnNvcnM/ICBJCj4gdGhvdWdodCB3ZSBoYWQgYSByZWFsIGFwaSB0aGVzZSBkYXlzLCBhbmQg
YSB2ZW5kb3Igb25lIHdhcyBub3QgZ2VuZXJhbGx5Cj4gYSBnb29kIGlkZWEgYXMgeW91IGFyZSBq
dXN0IGV4cG9zaW5nIHJhdyBoYXJkd2FyZSBkZXNpZ24gdG8gdXNlcnNwYWNlLgoKVGhlIEdYRlA1
MTMwIGNvbW11bmljYXRlcyB1c2luZyBhIHZlbmRvci1zcGVjaWZpYyBNUCBwcm90b2NvbCBvdmVy
IHRoZQplU1BJIG1haWxib3gg4oCUIGl0IGlzIG5vdCBVU0IgSElELWNvbXBsaWFudCBhbmQgZG9l
cyBub3QgZXhwb3NlIGEKc3RhbmRhcmQgZmluZ2VycHJpbnQgY29tbWFuZCBzZXQuIFRoZSBsaWJm
cHJpbnQgcGx1Z2luIHRoYXQgY29uc3VtZXMKdGhpcyBkZXZpY2Ugc3BlYWtzIHRoZSBwcm90b2Nv
bCBkaXJlY3RseSBhbmQgaGFuZGxlcyBlbnJvbGxtZW50IGFuZAptYXRjaGluZyBlbnRpcmVseSBp
biB1c2Vyc3BhY2UsIHRoZSBzYW1lIG1vZGVsIHVzZWQgYnkgb3RoZXIgbGliZnByaW50CmNoYXIt
ZGV2aWNlIGJhY2tlbmRzIChlLmcuIGdvb2RpeC01NXg0LCBlbGFuLWkyYykuCgpJIGFtIG9wZW4g
dG8gYWx0ZXJuYXRpdmUgYXBwcm9hY2hlcy4gSWYgdGhlcmUgaXMgYSBwcmVmZXJyZWQga2VybmVs
LXNpZGUKYWJzdHJhY3Rpb24gZm9yIHRoaXMgY2xhc3Mgb2YgZGV2aWNlIEkgc2hvdWxkIGJlIHRh
cmdldGluZyBpbnN0ZWFkLApwbGVhc2UgcG9pbnQgbWUgdG8gaXQgYW5kIEkgd2lsbCByZXdvcmsg
dGhlIGRyaXZlciBhY2NvcmRpbmdseS4KClRoZSBsYXJnZSBmaWxlIGNvdW50ICg1MSBmaWxlcykg
cmVmbGVjdHMgdGhlIHVwc3RyZWFtIHRyZWUgbGF5b3V0IG9mIHRoZQpvdXQtb2YtdHJlZSBkcml2
ZXIgSSBwb3J0ZWQuIHYyIHdpbGwgY29uc29saWRhdGUgdGhlIGRyaXZlciBpbnRvIGEKc2luZ2xl
IC5jIGZpbGUgYXMgaXMgc3RhbmRhcmQgZm9yIG1pc2MgZHJpdmVycyBvZiB0aGlzIHNpemUuCgpU
aGUgb3JpZ2luYWwgZHJpdmVyIGNvZGUgd2FzIHdyaXR0ZW4gYnkgVm9pZDc1NSAoZ2l0aHViLmNv
bS9Wb2lkNzU1KSwKd2hvIGRldmVsb3BlZCBpdCBmb3Igb3V0LW9mLXRyZWUgdXNlLiBJIHBvcnRl
ZCBpdCB0byBtYWlubGluZSBrZXJuZWwKY29udmVudGlvbnMgd2l0aCBhc3Npc3RhbmNlIGZyb20g
YW4gQUkgdG9vbCBmb3IgdGhlIHJlZm9ybWF0dGluZyB3b3JrLgpUaGF0IEFJIGFzc2lzdGFuY2Ug
aW50cm9kdWNlZCBzZXZlcmFsIG9mIHRoZSBzdHlsZSBpc3N1ZXMgeW91IGhhdmUKcG9pbnRlZCBv
dXQgYWNyb3NzIHRoZSBwYXRjaGVzLiBJIHdpbGwgZml4IGFsbCBvZiB0aGVtIGluIHYyIGFuZCBh
ZGQKcHJvcGVyIGNvcHlyaWdodCBhdHRyaWJ1dGlvbiBmb3IgYm90aCBWb2lkNzU1IGFuZCBteXNl
bGYuCgpUaGFua3MsCk1ldGVoYW4gR8O8bmVu

