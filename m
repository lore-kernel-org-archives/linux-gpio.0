Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402518;
	b=jYG+yQPD6Q54MjoQq76rog1RST3SSTzJKoCT0kRoRoxVUsPi53ixxh8QZMLB0BYJNC8z
	 fG/nzn3UHvnsQ4KLLP7OFHISq96GhAF2JQtSGRigyoF2P4a2+pp0lhjKA21Z3S4BP+9zK
	 7y/Af7XMniZg/ZuJr3/nC9x6Iqp2U3hLtCnvVJFJAOuaSLsJuKFfM5AYf18xiYsvGIjWU
	 PAMNERCDGxrNRiFfPcZzNQ1UK62xuOLbNLgGDmoSKrzqsGPAfTCWMvLV+Vxdr3js0DGvX
	 2KrypkZTO+B0rUhhab4AHkUSK1EBM3EaQHtIiIT7yJeaoiuHXBKAIYCXcu72pNyZdgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402518;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=gSQbVcKPQJwETt5FSUoaPH66H/Mu8r7z5yZRwgw9qTM=;
	b=LngBtkQID5QOPAUEs0Q72qEWV7p3lPgzpBty0BXZIuW7obA+fpD7iMKkgsE5AN+EQfoh
	 c1RjwFRcwcv3gv0C7UhXDEajDWs4Gg24HXs6KZetW5Th2NCBORDDklAybuRpG4HmEEuM3
	 F0LkAhPOVJbRHplDARMQSfqBGRQu8Q+t07988hbTI46wQnhwADZvX7nHDf+7fqK1Fhi2q
	 +7HtBpAb7N5eSv8SUSCYPd+u3UHMF/QkxhELD0xb21fwlTHXofThvdQgBt+mf6NbbZSUB
	 WQg3DhFrwC+AmJC2d2eb6hMYtSW6L5Ut8yPt3GRTlD84HuKLBnO+B4tkS1FKz2/w9+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CyP6U48N;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Fd8HMMvh;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3FD606A326
	for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 13:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B3FD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CyP6U48N;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Fd8HMMvh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794402516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gSQbVcKPQJwETt5FSUoaPH66H/Mu8r7z5yZRwgw9qTM=;
	b=CyP6U48NEphKdWZGm0NGAYw4ZgL/9yEtOaxLjN2odfWfumXQ4FP9WLV6QTzYUbqIwvpLxq
	IFADfrcjZCtJTwY5j3w0NXwHC8D015mnBo6uD0pnf1b+BvuDX2DHCZRtDKqRV3l9/qQEw1
	AFvNtXKvkOk3UuVNcnz5BxivSmqiSEo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-DuoSg6I4Ng6PryNk3iX6Zw-1; Wed, 11 Nov 2026 08:08:35 -0500
X-MC-Unique: DuoSg6I4Ng6PryNk3iX6Zw-1
X-Mimecast-MFC-AGG-ID: DuoSg6I4Ng6PryNk3iX6Zw_1794402514
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5337ed1ba44so66409081cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 05:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794402514; x=1795007314; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gSQbVcKPQJwETt5FSUoaPH66H/Mu8r7z5yZRwgw9qTM=;
        b=Fd8HMMvhZojoAzc43e5qYWj66PSuK9r8Vy2tyf9NK5ZuWxrImuxHbJKSWzgFyAtp1R
         pA41X1ghc1UBAofTN1mlnmpzWJzq0v1nppzBcj6+iY3Ubq4NF67RsqIL5nZxWdhsk2sV
         4Av1e/Tf8UHXqVCGyFITcYwERk8LXYXCnOK3Z2HPYefvqJ4LFgYomVBuFCYHublVWkFh
         ecp+NKWR/3P7I+9V/3D/jN6vdalEHDjZyAnDJ55RK5RhZNPspxVMgFQa0qZ+F3RRafqN
         s3jcGW1NDYs6r7TauTTu+Dl6dOjgjPwoIr2y4e0LW44TSBD9DSVwIAKOXfcDapZcmmX1
         /Rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402514; x=1795007314;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSQbVcKPQJwETt5FSUoaPH66H/Mu8r7z5yZRwgw9qTM=;
        b=IzTQ+uIEXlTjogcLgujivZfzuLa/9DHTEinHs+IKCkhP3OftVRqQNgnsbLWZBp/7bF
         ddiiA1MKIaj01mBFPUYOeRhrDuOA+ScJ6ZIxUUJLmW/XWVAIkuJX3oQsUGZvcgXWTEe7
         VVZOD2RMlemxmw4KX46NpmzIPCQ0Wk/eVUB/7ltpMD0z2DSSsZbfdcaUbjzV8QBAJ1lt
         LSluc87liozo42loLZipntJ/fWDzhRh+9UFCC0gcdA/NkaJy240qaaIFJXdum6YXrXQ/
         PFmyaFaf2/tckFb+c+qxj4M7UjsT7lMJQJLH7LLF6+mDYVPNj5oJxs7BPVBynCT/AhR9
         gv4A==
X-Forwarded-Encrypted: i=1; AL+hErHFGCPi6SiVTFtiTCJ1jd3fo5yw2wPP+moZxS6irMpXmN56CtH5rQlZ0kZZyoMl3eaAkQLkVNWlQCME@vger.kernel.org
X-Gm-Message-State: APuU4Z89D0/J07ZKgZ2yHzBCy93PE+K0Ymgnm39mYJSMfStPfwwaUwjs
	RZM2x63yWRnYJXiR50K3On0Hb1ryrVvOEW0MZvp+hfeRqwaWZ/iXcCXvxvYUu4DPj/hbPr/hcw4
	Qtf5D7udB969RqwcTG9zVqe3OhY0vz/MWyfmms3kd3WGNSvnEXuVf95B5uje3dmc=
X-Gm-Gg: AYBFou2lS2shtIJSAa817dnCJNb4x45ilp8H/hrqJMGQ/CM4rupCkMLbTKCLowWYISX
	1iboFgCEhv4ZzCQ5Ih7bkZBr4l92aPWvd3pt/vJuZgV7BSCHsjpR5EliYQg5UxdIpWkEmFq2T/0
	97I/r+0wWsibKP8S88zZCFWke62lHPLehMVy39Uj8vDQImMP/J/WvxELcIHTrnR6v6q9kIsXm/M
	e1xRdZwWm8G0olk3lB+E47nW24OpP0vvLy5CCFh5iTHImv73xIHfrGwJEVgn3uRn4r4spx0+AEH
	8mYl2/EPok3wbsI3rDhsyLL2XqR2ncN0x97O8AhjdwVrPFOFpHZBTSh2ZEZsfIOEU4hZmm44P2B
	paFFAS+i05NZLxO2YvtjN3PPNDv80+sQ1o701lZCUdxeQMbBRZxxMmQG2uRv90M+zcuQ9762YPy
	F+ZwlRmN8Q6zn4twZ/tkfUbQMdOBVWEFXTQ1G7bniB
X-Received: by 2002:a05:622a:1907:b0:536:2fd8:a4d8 with SMTP id d75a77b69052e-556bf740beamr31921911cf.15.1794402514498;
        Wed, 11 Nov 2026 05:08:34 -0800 (PST)
X-Received: by 2002:a05:622a:1907:b0:536:2fd8:a4d8 with SMTP id d75a77b69052e-556bf740beamr31921281cf.15.1794402514008;
        Wed, 11 Nov 2026 05:08:34 -0800 (PST)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af5f09fsm49902031cf.6.2026.11.11.05.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:08:33 -0800 (PST)
Date: Wed, 11 Nov 2026 08:08:32 -0500
From: Brian Masney <bmasney@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: intel: convert to subsys_platform_driver()
Message-ID: <avRo0ItlTKTKyZ2f@redhat.com>
References: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
 <20261106-pinctrl-subsys-v1-2-f17582f32aaf@redhat.com>
 <avJKiYtczueslNSQ@ashevche-desk.local>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avJKiYtczueslNSQ@ashevche-desk.local>
User-Agent: Mutt/2.4.3 (2026-10-09)

On Tue, Nov 10, 2026 at 12:34:49AM +0200, Andy Shevchenko wrote:
> On Fri, Nov 06, 2026 at 07:27:13PM -0500, Brian Masney wrote:
> > Reduce boilerplate code in these drivers and convert them over to use
> > the macro subsys_platform_driver().
> 
> Look at 20261104113343.1634218-1-peng.fan@oss.nxp.com.

OK thanks for the pointer. There's no need for a follow up from me then
since the series from Peng already covers everything here.

Brian

