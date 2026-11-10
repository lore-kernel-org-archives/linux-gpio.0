Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299538;
	b=YvO6WfG02bV2EB6xadZg4lKL9uq74o5PrfBPVifQSDkJwN3RE0EkmvY3r3HK6NkgLfcD
	 aMDWiRa+gV2KQX01rRExTIu/kMJ0+cDyd1XNrEG1mX1179D/WfNpSclz4vnF5ZAamtcxC
	 XbKRUwnpgTE3xpjlsLyUbCWdR0ALQRzO/18yuke89Yzge+9CLd+OV8+0pR/fKBNsBA2Gl
	 VMeXvKuzUejFJCl5XrgicDKaqOHXc8ZhSxC0tblpRMrvyQV+78yctgvZjHazLPGqhKJby
	 5K7Q/k11K0n1wB/FHmNhoACg+E77QmmKVi3qOHETfnHp0NNAIiChmMFYwFVIUREpCTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299538;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=70ESFht+UiHThf90bMbHeF2zrFG6jP+i0ViXjZtHihk=;
	b=rJUfBTHXbVOaIkcp19MZ5BI0ejM0Drwnmh39SXo2MDrfZUaQgeW3ywFhhabOhz4j/5Y9
	 xs99lG0RqHsDI6+ZFEC9qyODQda6XCWNgb8hcTeBVA1GgAuymLA//1PpJxIY+B7yVEIUB
	 9nfa1eXQ1oFMX70bDj66fR+e3W5TvTxOYw9bjCeVRCmnMQIT43mVRcbGuCBX0wvS3w44f
	 EPTHtM+yJ3qAbOe192J8WPf3GwnaHehiOEJIZSPyOUKRMwLO7ohbAsS5HCWV5lejgtnM1
	 32UnOiQLQzwRx4Rj9LJE2Uf3dkj52yI97nX0KQd3HxCMEZ1eOFbU5ED40Ek6JQuOnow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=HLyjWysT;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3064606A32A
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 08:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3064606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=HLyjWysT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=HLyjWysTnnUGMrq4CDWU/2+iwJFQL6U68yWfv7mayR8xFLUArmBzAUnlFafsttWAyk9vul8mHaa9j
	 82EbzHy/JbSLIWaenuHgSYk1Dz3OlGhJe4nGESwr1k233YgdO4oZU4BU2NZVihnuypJtOII2koGV8L
	 bCE9EEHQA4vXvoVQ=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af2d68ee5a-6cf53;
	Tue, 10 Nov 2026 16:32:16 +0800 (CST)
X-RM-TRANSID:2ee86af2d68ee5a-6cf53
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2d68f175-ae019;
	Tue, 10 Nov 2026 16:32:16 +0800 (CST)
X-RM-TRANSID:2eea6af2d68f175-ae019
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: linux-gpio@vger.kernel.org
Cc: laixiangwu <laixiangwu@cmss.chinamobile.com>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH] pinctrl: stm32: Fix reset control leak in stm32_pctl_probe() error paths
Date: Tue, 10 Nov 2026 16:32:13 +0800
Message-ID: <20261110083214.1507-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <sashiko-outbox-206463@kernel.org>
References: <sashiko-outbox-206463@kernel.org>
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

From: laixiangwu <laixiangwu@cmss.chinamobile.com>

Hi,

thanks for the review.  You are right on both points.

The Fixes tag indeed points at the wrong commit: bb949ed9b16b only
replaced the child node iteration helper, while 2254e77665d5
("pinctrl: stm32: defer probe if reset resource is not yet ready") is
the commit that moved the of_reset_control_get_exclusive() calls into
stm32_pctl_probe() and added the -EPROBE_DEFER return path.  The tag
is corrected in v2.

The clock leak on the -EPROBE_DEFER path is real as well: the banks
processed before the deferred one have already taken their clock
references, and the deferral return does not release them.  This path
was missed by dfd8259507c5 ("pinctrl: stm32: Fix clock reference leak
in stm32_pctl_probe()"), which added clk_bulk_put() to the other
error paths.  Since the deferral path is restructured by this patch
anyway, v2 also releases the clocks there.

v2 follows shortly.

Best regards,
laixiangwu


