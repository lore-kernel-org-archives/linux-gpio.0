Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156449;
	b=x5/9R7j4YsQgWiGbqbPgN9jxemnTGlpMZ5NwptcCGWwD70G4pxSRkjvCrI3gMzoih8T3
	 Iq5MTp3pHEYIkmY9NZqPxQDcy96PMYcWf1kFuklEdA8nQCqYyH++qZEfCUYOIoBtlFPh1
	 5ZIoFlVwru91Mq6B0RvqDXiP8dETVYz48ooT0POE4gABB6EZywDnqY1IGUMy9R36fHxxu
	 F+goEr5pG7J4S7KU8T20CgX0wOY+/TWgC20NlGNpTe1kOqugjaYoJUCCVd5VMwE7yAHya
	 2bzt2PP2rn3DnRo+x3ME314dzEAPZPu+XjvumxVIn4gnul5uOWe1F1fCD9iLke0VbfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156449;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pr/L5UIhdSBgIIxRY4ACmBWKTwcC0Vu48k0+5gmsT6M=;
	b=Dg276VUb0PNhWlUYbmTiplMOtRB3Pm+uVkyyjzOET/tSIhv36fefbx5eyU5pYbzqY99x
	 Xnmld0ulCSwbdWQ+UflmbWVcr7CGHsJ8qP3GtO5iMUiVF4jumkX6HigeYK1MpWLx8S+kM
	 wVOebQn1bDq4mTMMR1OR1Xwm2RpYWdDWNEWBj4x2+6XRnA4HFjwXXHsadvTl63upNSTcD
	 Rd98w8SLEnEh4lE6FZdaFKCnb/sx0BSAzuF7A58GntLkRF3AG4DBdsGtedberLOcQcgCp
	 IcCOwlKi2233DNvyA1w6ZXKL4XleIJ7JqgVJ+ildGKdRtLoIcSkRrRs1d62ySP+vTVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=kbKf4zdn;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5F7606A320;
	Fri, 20 Nov 2026 06:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F5F7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=kbKf4zdn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=kbKf4zdnWgA0yU/eStLMFCJJlBuQlwxbM+DAkzoM7eK0jGWCblsAY/V2Aun3U1TxASu+t2Lz9Rmoc
	 j+ZywrVn530sZV8MV7anHRrVBT7kqCmk74hFV7qaezea/K1PnSGxJ2zFyVvwPfLt8DadI5ivLSQFyA
	 qIym8v969OyyttP4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66affe9dd8b1-f1be3;
	Fri, 20 Nov 2026 14:34:05 +0800 (CST)
X-RM-TRANSID:2ee66affe9dd8b1-f1be3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16affe9dad6e-18c1f;
	Fri, 20 Nov 2026 14:34:04 +0800 (CST)
X-RM-TRANSID:2ee16affe9dad6e-18c1f
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: antonio.borneo@foss.st.com
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	linusw@kernel.org,
	krzk@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() error paths
Date: Fri, 20 Nov 2026 14:34:02 +0800
Message-ID: <20261120063402.788-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <2a6ea91480a6c002a7354ce1223c1d904891371f.camel@foss.st.com>
References: <2a6ea91480a6c002a7354ce1223c1d904891371f.camel@foss.st.com>
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

Hi Antonio,

Thanks for the historical context.  For the record, this is about:

  [PATCH v3] pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() error paths
  https://lore.kernel.org/r/20261116031043.502-1-laixiangwu@cmss.chinamobile.com

On Thu, Nov 19, 2026 at 07:27:19PM +0100, Antonio Borneo wrote:
> The driver's "resets" property is not currently used by any upstream DT.
> Using it is also problematic, as asserting the reset affects all GPIOs in
> the bank, including those already configured by the bootloader or secure
> world. The current driver uses this only to deassert the reset during
> probe.

Thanks for the background -- I had a look and could not find any in-tree
user of the property either: the only rstc use sites in the driver are
the of_reset_control_get_exclusive() in the probe bank loop and the
deassert at probe time.

> This patch has the "Fixes:" tag. Whatever the evolution of this thread,
> I think this patch should be taken for backport in stable then,
> eventually, followed by the "resets" removal.

That order makes sense to me as well: fix the leak first and let it
reach stable, with the "resets" property removal as a follow-up cleanup.
The patch is ready as-is (v3 above); no further changes are planned from
my side, so it can be picked up whenever convenient.

Thanks to both of you for the review.

Best regards,
Xiangwu Lai


