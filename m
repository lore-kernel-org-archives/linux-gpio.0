Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0829B44A3F8
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 08:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424726; cv=none; b=Kzhu952ADOnsZnhf1onsCcHh96subYSDO8bmNPz4SR6QqGCJCOhom+Vzw1vqfTd4B+lzSs+HbeRx6ujLbATldXdqUhDm4XnhppcCRxGaKC2AFd724rG9rB7y6vh1Osi6DJ2HMen3LOBorT7jWoLVnJmrga8XOYcnq/Rj8oIxGK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424726; c=relaxed/simple;
	bh=GRvwnXHVy/jqUCw/PL8fHu/IurmtPlulBPvKYqgBdWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=usp1eiz6W/G6w9dbOAhQMwLzSlmXAd6BbKBuarvpFvw8lpUPCh5B9uhxI+NzKwxb9zYz6D3aU04d5QZRF6FyN5SctHa24E3Imh21Hixs7qMfn2SO2oQT+T4/F2Xd0zh2PWOCXSjgPCBTCeSrUR5IxLA2B6KsvX4evtPB2ptjVkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxpTWpBp; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxpTWpBp"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so1342407f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 01:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788424723; x=1789029523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRvwnXHVy/jqUCw/PL8fHu/IurmtPlulBPvKYqgBdWo=;
        b=KxpTWpBp2z9O0bZlfiiCrfDE33AeDdsLj55sul/OKLPWoq2t2us6hR0wA/oYmrnBKj
         PncWq0OgiKTca4aN2FF+MTniEjUVb+t99On0ptlaYCniXNkFSXkMP2ZK+HemnuHaHPd2
         b+R/LAHCharc0trFSVIP/KKPCcJ7fuMc+Ex/ykNLUmmmvHzB0oufkYhh9Ikqbc0wiFGC
         oLed1GbjzXECGAsZvxunY4iVxgN5I7PSYUBdZkz623z+/AOWIrF8MYq7hp+uENkkaXYw
         wz9Y0qUw/p028AFWgto/J9i8VvgkCXWt1IVhopBh8y4WzRLbWKlDnJFs/3GaZ4uo4ZWF
         pvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424723; x=1789029523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GRvwnXHVy/jqUCw/PL8fHu/IurmtPlulBPvKYqgBdWo=;
        b=S64RKUMyE3ZiswwC+toK0AZZUAkHxEwihF8cx3rdMpR0wpXdouwzaWLWxxL7brb/ra
         MmSgujL4gIj88Wdi0yhdrhyPOyVFm2hMyYCKkwAgxmov3a4WtSbsV6EjzzZbyYL5piLQ
         ZZhF4P3r/LEGY0ih+rr4TPm9a3mkc0pPsoZgebT/RFk/7hch4uBDC2ERS91l1mxQk4bL
         OsAlvggG2Zn9GHQmzY3MDHjn4wX4jWnh1ovm8UIBWB6BaTA03J1XSGx6TkkYp5vB6uKd
         x+C2OTKLs50UD5pnls0sL4hWZ7l4teAM94oj1TnPpDb7m3PukvRCUNDTGv4K2AwsGtiC
         Mihg==
X-Forwarded-Encrypted: i=1; AKwUvBwTPNN0WTzg8EcHzrNSIV1VM8l6Rjyo6GCrYVYa/vtJW1NWQ+qirFl14gUdJcui2peF4wIRYe1JXDqg@vger.kernel.org
X-Gm-Message-State: AFuF++n22UUz4PC1L84nxs8ZHiLmjyF0qf3eSzxjoY49m4wdMDKpNPoV
	pkAKiZ3hUoUnH3dQczRY+XV6ZBS3wOcU/65j5l/sI4l1Ah3TKLa/+SxJ
X-Gm-Gg: AYBFou3tKrDK8Jy6AWtm66iQLZ/rM6c6G3Qrr6HZIBKyHC4ZW83FN71cYT2N51iGfEo
	WiY2rhv3QeBj0WzcHUHqsXj23IPusOc3VAPSVzlWYoxDYWYZUrvyDb2ROnn8au/gGJpmbZ82cx6
	tOfqJo5cVFlcnEnwlbUENga134FlMftuHWZeni4BNnY2G3gStas25lVQRPvf13o8WiwOQme4zD7
	Q8JGVXXDvmoLMv+vIw921Q0CngL/J74g9rMHMvGT4Q7SLcnhM+Mhpy1eWsXS0bkPXk80GxIbJvf
	nWwJ9QC8mCl97ZnOH/+OYlRHk4M2uVplIh/5H1u6Srql7f0nvSa63JUKzkSQAvr655vfEpdOjf+
	+bn2U9kn1ZKCVz3Z3NJAJjz1iS3lryuLsg93GxePS9ggHQ7JUoIboZsjElYUF2enbbtsTEBPydZ
	9g5PmoK8/zvNew7Q0wmVa5yxn0ZMMoF0QpwM+/bXRvwuK52iDejv1m/B77n93Yf7I6cV1YyxfXd
	Kk1
X-Received: by 2002:a5d:64c9:0:b0:482:fa3c:3e95 with SMTP id ffacd0b85a97d-48488f07dd0mr17932547f8f.8.1788424723044;
        Thu, 03 Sep 2026 01:38:43 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeae34sm13075059f8f.32.2026.09.03.01.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:38:42 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v5 0/3] gpio: mmio: report the line direction on chips without direction registers
Date: Thu,  3 Sep 2026 10:38:41 +0200
Message-ID: <20260903083841.2114833-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAMRc=Mc3u+2ApzMfFFM1L5MJROaQMSifKReJ-3T+9EX3Zdqzfw@mail.gmail.com>
References: <20260903075940.2089367-1-mehmet.fide@gmail.com> <CAMRc=Mc3u+2ApzMfFFM1L5MJROaQMSifKReJ-3T+9EX3Zdqzfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> Why are you spamming the list with multiple versions per day? You're sending
> a v5 as I'm looking at v4 and I really don't like to have my time wasted like
> this. Please limit yourself to one iteration a week unless you get a set of
> comments in which case try to stay at two iterations a week at most.

Sorry, that was wrong of me. v5 is v4 with only the get_config()
documentation corrected (it said the answer comes back packed, it is the
bare argument), no code change, so please review v5 and ignore v4. No
further version from me until you and Linus have had your say, and I
will keep to one iteration a week from now on.

Mehmet
