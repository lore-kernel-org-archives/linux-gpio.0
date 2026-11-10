Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324538;
	b=Fhe0SBge9ir9Y4nNfleKLoTKlnBEtTEr6gxp0NF1RkX5JwXe4IvLzAcgx2Rwcs2dX14R
	 7zrPPrROQMm1g3cLMgWpISONfzE2nsz+nkdRwH77tScaqvO2ptLQCpPCeq/9mkKNUvDf6
	 bFkhkdyGGULikc76rn66IAS52xSABSugC/B8yZqSs/VylGVlRjthN/xQSvSRfEG4CldXT
	 2CAX2g1CzWMRC3/1whVsWpluV5DuMC0h8xfr7KnGABQ/OhSxTGuwjCwYrQOR66Ky+A5HM
	 58LNS+6qqfe0hvVrAU9On2vwr7rxiDkVXTdka+xI9zfLvg1zz/tZ7dyRsgr2EhX74gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324538;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=mUYDf41+X9Rx4GIPVhrKc2PRn+Qd+EHAXlO95BcvWtY=;
	b=G535rPhkqxyf1vO7Sx6hjQ+GD+4mqrkTpPEIZTDSKLEpJBt/u8+Y6t2BiSdB280yr3mR
	 KTS1Gx9DIH4fiTZ/WsfndHWr1yKYPuXtHa+w3PJrbD0ni6Vej2YNmcGfgp7XT/wzPB4o3
	 PRhYH61B6CwxenocT88/14mss6aa5eCQiuMX4q5uYxNJxdUhrSJeNuHWPIhI3UdXO5yPU
	 MEFJI9XD7l4S1IjD8kHVkjyG5+RY8c2W3BLUkOKFCdrCh3+yREB2ehqngdEER7sQupxvX
	 IGWI2RdgmW5KkHJD1sExtzuT6skOP7nbCO1LEjoK+YRZwn1xJ6UlKk8ynZE4QLwHgBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=R6DDVgOM;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C187606A320;
	Tue, 10 Nov 2026 15:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C187606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=R6DDVgOM
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jP9Xy4VhVz57HS4;
	Tue, 10 Nov 2026 23:28:50 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794324530;
	bh=sgdS8+CRk/K7PyQ5rkTNFkY22PDDkUuvh8Y6H7SrFxU=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=R6DDVgOMDpIMtcEdQGNg9aLUnMrL0kuLFruTsmK8uPLB+xM4DevWWqgBWDdK3AToG
	 TBGg7KlaCbdhIwdyGtHQz4hhNFHGKdweMaYH4Z9qIaxD+Ja78Naca5Emw2KsY6n7UT
	 O0hwaLEbUoY/E9Fgoe2atDXTwN1kg4/ipuOGpGdYaGrsq+ISLlMDZQHQ1USULj6maH
	 nio3qQEttCVJs8Vgdq3KRP54Fh64Mallq9pirpHwbW3sRvWXIjIS1yBOEAcTbf7fUd
	 I7jtkVSCI1W/ojR45SZilwx8m8JuYS9yMs4RAERrUrYrkqD5fQIAyioqopbnyWaL/G
	 2qHkZD9nKUaGg==
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 6AAFSmPC023778;
	Tue, 10 Nov 2026 23:28:48 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 10 Nov 2026 23:28:52 +0800 (CST)
X-Zmail-TransId: 2afc6af338348a6-1bed0
X-Mailer: Zmail v1.0
Message-ID: <20261110232852593Tpt7NKQx2FbQNiIR9iI2X@zte.com.cn>
In-Reply-To: <wnumtnn447ikxwfjsfnflbxmx77qmskteldxstubbjsnihjg4h@q4enjdzeyaki>
References: 20261110225742308FW7iPw8mc9gwd2DU0W-_w@zte.com.cn,wnumtnn447ikxwfjsfnflbxmx77qmskteldxstubbjsnihjg4h@q4enjdzeyaki
Date: Tue, 10 Nov 2026 23:28:52 +0800 (CST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <brgl@kernel.org>
Cc: <linusw@kernel.org>, <jelonek.jonas@gmail.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2Ml0gZ3BpbzogbGluZS1tdXg6IGZpeCB1bnNpZ25lZCB0cnVuY2F0aW9uIG9mIHByb3BlcnR5IGNvdW50IGVycm9y?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6AAFSmPC023778
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 10 Nov 2026 23:28:50 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF33832.000/4jP9Xy4VhVz57HS4

On Tue, 2026-11-10 at 16:17 +0100, Bartosz Golaszewski wrote:
> When sending a new version of a series, you must include all patches, even if
> some of them didn't change. You can't expect maintainers to comb through
> lore.kernel.org in search of all the pieces.
> 
> Please resend it as a complete series.

Right, I'll repost the whole set.  One clarification: 1/5 (rcar) was
withdrawn after Geert's NAK, so the complete series is the remaining four
patches.  I'm sending it as

  [PATCH v2 0/4] gpio: fix IRQ handling and probe error paths in four drivers

with the Reviewed-by/Acked-by tags picked up on the three patches that
did not change.

Best,
Shao Mingyin
