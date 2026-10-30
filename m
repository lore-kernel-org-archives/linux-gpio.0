Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369027;
	b=D4qmxTgE//+K2q+j204zAPWKglbJXyh39XcJIu0cLgGIp7Uo2+eeqHUvIRGsVS5f1Nqb
	 UHIP54bAbnwp0or45Wj93iA2qayr6iqcQwgW7/YhIElms6nUwBmZZHkXJsSA/CNmwQGYZ
	 rQZa8uOlrCTQKmm8u+aQePVRZPS2nebDiSGKc3OiT2Rzxjqpm3q+ymf/4dVPBxLtbJ3Up
	 mvxJjOpprLwcBvp328tzApraTBnCa34UgE60vDN5QtJirZXpu2M69xMGbOyPKH4BL0gBd
	 8MJ5MWCJUDrwf/o2QlbogFZajNvup3btvyptY1EiXXZE2t/mqgbgFH23xjSLAxVW/8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RNi/YV07iESSp5HzRPxOu8kqkEJ5qhQDfYYkAe+T8VA=;
	b=u8I6sM2gF/kRg+uXPSZ9ROuebiU8PyhAiZapAWjJJN1mo5aogoY5LaKvlNBpVdPOdHTd
	 VavPTRMtfQDMe3s8AU5cKMBW3OkjrCf2R5YG3gCGK8EhsrZj36sGH1WcORlCPln8oZiLE
	 Lkknip6zekQrr/f+qHUTe7qC9JGLTTAfFEmJ22avYW5R/7Fqy9QpDRdxl48vON2KSmOPW
	 YvuSqpniRRhJ/jkL3w/kqRNRCy2B+HI3UTGxQSxDcL2o1CyCOW+sYX+Iz2MhOFmbf1XEO
	 S5VAi1WKqUvNCGchvZngZCVNH6W5USGQunzGdi6+WKDVJmXdF5Ai6nJOBaOAMpQFSUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=efYy8ccY;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C23606A31D
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 14:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63C23606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=efYy8ccY
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so614971a91.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 07:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793369027; x=1793973827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNi/YV07iESSp5HzRPxOu8kqkEJ5qhQDfYYkAe+T8VA=;
        b=efYy8ccYHATE2WA0wZRSaVlN8TOl1bJEJ/pwwKfOu7DOOKWLhFAfasds2OCArHT+Id
         84hoQgBBMImfH+kgaJN7XBxMxUbJ/yLWe3W+SogXWdXvJP6oLcEOVQCJqfDcIPqXS9gl
         QvpoaRu0KxaKcux8E+xlqIt37lfVM0gjjntcZ0uIrOJRLUOywSYqBQo4mKh66qmIAo7D
         Clnl2+00funikVLTNchh065sDyi9fuLOw80s+ibNFzdoLsIWKUgJj5J9m4yUEWxYNbVR
         srKt6BY1prlXhzgsO30teQwzpNf1yJc87KqdhVRT+vaqvzhD2OhMIWEpq35Q8ohNpm+y
         4YaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369027; x=1793973827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNi/YV07iESSp5HzRPxOu8kqkEJ5qhQDfYYkAe+T8VA=;
        b=vnFVLsXSJQMzILTlFbS941EGUiFHcjxRTOPZVjWd6J48ompZQMsD4KtD0Tiaper3tO
         FIWVu1rhdbzD3uavU2Z4y6J8C0ULz3pvRGYQJs0jN/+7JRRX4jbAQVrbIFlkD7TP6Y7y
         D/4mGgi9ICayS6VWotyu8/xUdRxW5PqMMVsZbPK9mr9MDXhGdJtBE8nKniFVKdzZGfnN
         /Ft7iTEiGBm6c0ex+Cus1UC0KvDgT7JdeDyAGB1fSESO4rjesAIA1abh/2QbMKTQsNK8
         cOnKpoqdIeuBC4ew67eq+g2iWwuXfhKHmp2Z+iQD9MY5vBxC17N/cPrOc9JXvtJMRxx8
         bxcQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1duqQvZVqtxz9nI+s5ZXN+nl8JGiSMutM6llFk/8bEfsJNDfaB3XUQ5oGyDAYkWhs0TXWfQD5wiZk@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1a34Pw3g4yhMM+/4DiZqJSaaWtJ6C3MlOvNFuPP3FcQgUEiA9
	aMQ33kyBvAX1OdKUdAzYUHN9rhu2hHbRO3prhmzfbcDn2b6JlkePR8w24EA8evWc+g==
X-Gm-Gg: AYBFou2yYYOHApO1vY0x3lyrIvg/5mASBCHe6qT3wLkA2kWrF0hS+takW26JrjENXDE
	DVCrbPBu6G+HNiGsln8+ybq2JZSs2Hu4Kh0aaTQ1rKioY3im+vBLY5j/ZnmAx+BfU5qhZTX7wy8
	EOxAIx1qKGkzT4sD9rzZ/fLNQ7r6KO4lkM7IuEUuPv+k5GbUJHGGeOZIEPuTQ5IC/SKcsYvJeQK
	yA2nWDg7taOnkbMvGbwAGpnno++kbmSimhgzCdqMrtHgTxXoxHkjPcut72l+J9QQLyIPh4Q5ERr
	Ch8jKo6owH/Az/wSo37IDD2lVDZ7m+bhG3ZyOZLGlDHTbEEjREegeTgEcDAzQYDnIdsomnAGCn6
	KKFUrjvOxZGFvp6cxo/ENyJjz4WpLDWM1iyAlK7PXtv8XEjX0Ihzeqo9wbTHdceHTlXMvBXGYuM
	vVx858YozoMUnY4jtEtiP4rLhrzItDQ8QAUPquN5XqHDXaFbBhLhZD7icrLuYMq0VT6q6Ef3U0R
	tandiPocMaDLAvbyOA4fXEp6u9Eg4OROGFWs7ouVBYXczEwcjMu8Uu1QT5aENSvlXpHJ7mIu4h9
	wlxtnnzStq/hLQAS9AgC3NYWbtBYOc+UKl79KsOHxWftlbR42y22WRWifJaPFHg54vGJ9hPdzTU
	R8qbPmLSblNKAUZny
X-Received: by 2002:a17:90b:1b02:b0:3ad:8769:8741 with SMTP id 98e67ed59e1d1-3ae8957453dmr1915084a91.4.1793369026593;
        Fri, 30 Oct 2026 07:03:46 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f3e087sm2002137a91.1.2026.10.30.07.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:03:45 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Johan Hovold <johan@kernel.org>
Cc: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Ravi Chandra Sadineni <ravisadineni@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: don't defer the USB device probe
Date: Fri, 30 Oct 2026 21:03:40 +0700
Message-ID: <20261030140340.3383998-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <auSdA8MfolA8OhdM@hovoldconsulting.com>
References: <20261030114705.3159093-1-jjc@jclark.com> <auSdA8MfolA8OhdM@hovoldconsulting.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 30 Oct 2026 14:34:59 +0100, Johan Hovold wrote:
> I guess you can look into replacing generic_subclass with having the
> onboard_usb_dev driver call usb_generic_driver_probe() itself or
> possibly adding a pre-probe callback to usb_device_driver.

Thanks for the suggestions. It looks to me like your pre-probe callback
idea will give the cleanest fix. I will try that for v2.

James
