Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560889;
	b=ab6TdJkq6bH8NFKh4NfiN4dn3ip7V006uNBjQ+YrcgJX/8k4RnY7GxHjO19Bg0tFuneF
	 hreorkYEZbsCpw2l1vufrFF3w9Zt2DaDLWygVngDgCgH5qXGp48sMxxD2Xwa2+eelHQHH
	 9gUkqy1KZXKuoG9/tfrKynDVRfW90BjmTCw+/dS6wNW4IsDbo6DmMrV1q9MnayIAeGcAZ
	 il0GT2x8wZH+sJC61U6x8XvJAXEiBKMaQR7zAd5xdaAcWBZ6vXCz67CeMBxpzeMAEgcUe
	 3mrePnvg7e7eHJ3ztoMm4gAF/hzKx7UHEupEc5VKej3R27qYw6d1elwrFOhbiNahZ4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560889;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0GecHqzD9XMLLqQpFV2TvML1OoK0QcP7ZCMM+WBJVSE=;
	b=RIyKELadiv6kbBO8BljEWzEHQGyhIKZGVSwUJR25aQk3Ha1C1rNRZAURPQ0WI9pEKchU
	 4ngmPYTuRxbe1TeJwY8PvHJLoiP90QsTkZnWjMwK4RjQkdrPeMlX2A57whILhhBZHzn/k
	 Gx5ZDBZe4xNfdzF8IJuAVRjtn8j5iCqNN4o2hbnhmoLlrpTiy1eK213R7ZmEQYuZNCuk/
	 edHMpl6J0Snaau6LZ6+f5IpC2gy538GsW/Q+IoQkyNfuDPzBqdW4IIe6qR5E01Ns+sYoE
	 Bj8AdxrdimWHD4BeXayuE/tf41BYMu9YUtAkMtlNZx88Y0L4k9105QNPzmkiUjgg+Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rYutiHMm;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6B5606A323;
	Fri, 13 Nov 2026 09:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA6B5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rYutiHMm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=rYutiHMmz3OiWRdhEavqRFXhCWPSYtvvbngDPUI+NNBBL07yVKsGOfXywF3r7QdO5a5uTAMeujb1t
	 RB46NfSoLgbvqMRSLZU8KxRBzRCUhxUdf/mbcxfnof5SF9b+vkRMDIltim8wrAldfWU1Rb+HsM9TaK
	 atQFXrhfTzn5VTwA=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af6d37414c-c6741;
	Fri, 13 Nov 2026 17:08:05 +0800 (CST)
X-RM-TRANSID:2ee16af6d37414c-c6741
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af6d3724c8-1fd65;
	Fri, 13 Nov 2026 17:08:04 +0800 (CST)
X-RM-TRANSID:2ee16af6d3724c8-1fd65
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: geert@linux-m68k.org
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	linus.walleij@linaro.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH] pinctrl: renesas: rza1: Put fwnode after parsing gpio-ranges
Date: Fri, 13 Nov 2026 17:08:01 +0800
Message-ID: <20261113090802.2036-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <CAMuHMdX4YdVWBLKozBVKsk-cqnBjHY-4H=2hZP7g1H_3p2O8cA@mail.gmail.com>
References: <CAMuHMdX4YdVWBLKozBVKsk-cqnBjHY-4H=2hZP7g1H_3p2O8cA@mail.gmail.com>
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

Hi Geert,

Thanks for the review and for fixing up the Fixes tag. I understand the
correct origin is 5a49b644b3075f88 ("pinctrl: Renesas RZ/A1 pin and gpio
controller"), since the missing fwnode_handle_put() predates the
conversion to fwnode.

Sorry for missing Andy and Jacopo in Cc. I'll make sure to Cc them on
future submissions related to this driver and the original bug.

Thanks for queueing it in renesas-pinctrl for v7.5.

Best regards,
Xiangwu Lai


