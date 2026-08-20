Received: from send170.i.mail.ru (send170.i.mail.ru [95.163.59.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626892E92BA;
	Thu, 20 Aug 2026 07:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.59.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210991; cv=none; b=jHXnDv962xmQXZyBrOV2qRLCi948XJecgeu77v2h1Jj4rpNCAFnaXCCWJgbYybz/KO3mn9YFBb4/745OQ++PKcK/o4LhAjUTdLCHavhFo3qfencrca2AohxaKEC7XcKOaum0mDvvqxPKUwhxA0DiHW9+h0iwQLdyx1kllJkXbxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210991; c=relaxed/simple;
	bh=III9DD4RJFxOiMBJTA7dulNQyODzWbim2gbISV9krTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fl8cYSjDV+3gcr+F7ZX5vB5P0U4ocEqBlMDySvnOfD+rP5yD1DVzkSDjhYtsqjJI9jgLoOGMJENGbCxZM7uNlYKlzK0UqLBgL3gUzUHptLPhkm93W8eREfg1u9Bj930i1zB1Zl0CkoCX9Q/U1koMLut3vJTLL9P6iU9ebgUtVtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=d1KL/mR3; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=Exzwq5vh; arc=none smtp.client-ip=95.163.59.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="d1KL/mR3";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="Exzwq5vh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=Lf5H28g8wCJv/ntfYUV0bOXDq6hNp839bO1sadch4yg=; t=1787210988; x=1787300988; 
	b=d1KL/mR3+He2EG6gCmU+D+AZjidoF09qvxVWxLG7mJa++0WUE3Fgj7DFXcAXMdDWiNlOYb9V6Cu
	ZOVShdQFv5HSEYzCwsVJNrCGrIp4idixX3LGebAGKEc39I+ZeWkhNsqzLcN1XKIsoUQixQqwjZx/F
	mCN03pyNTGk56llGUT7R6OQhfJQoG0uXf9robH/gHB6LBe6HHwsvQrC5Emi1PJCwWMIs5VJTHF+PV
	CeuwH7k1hUCvpqMsKAaY7eil6pLHNELpvYnc+QLFoNzW7H556T/Wg7C3vxvtNZR4/UhCH3a1+ZPS+
	XsB/eeG7ZFigpwTwk4cNGv3uoAIe8bKASVjQ==;
Received: from [10.113.47.149] (port=57142 helo=send279.i.mail.ru)
	by exim-fallback-cc5d6c65-8tkwr with esmtp (envelope-from <misha.zavertkin@mail.ru>)
	id 1wwwyy-00000000Ngv-3rnX; Thu, 20 Aug 2026 10:14:37 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=Lf5H28g8wCJv/ntfYUV0bOXDq6hNp839bO1sadch4yg=; t=1787210076; x=1787300076; 
	b=Exzwq5vhrkuIJtMTReaWLSaGago/iI9masIzWg5xajY1ueDKlqyClvVLq5IjQOy2scSIBbxehx8
	oCiib5K6v/r3vGtT6YgQsslWt+uISmTgKbOZ+DOS8fVgmdGUKRVREY5seDs7wkkPqTZaQWinSWRJV
	8UL6NQvQ6g6RgPC7McTq0L8U60c5Zm3ocnVa6LtBQcNu9/Hhfvk+EVKFKAza0ITlH9Bo6ZweQWETI
	uis8pwB2sC1LcAfhJru+sjRP2Jf5C2mDR38HdKnL2CTH4/AONpTPXlqci7Tj4UxTfJxXTQ7poHQHX
	GRg5Upw4MFp1vXt28i+8JBz34A/uhBD20fAw==;
Received: by exim-smtp-67896c5f6-qfjrp with esmtpa (envelope-from <misha.zavertkin@mail.ru>)
	id 1wwwyo-00000000Ilr-39PQ; Thu, 20 Aug 2026 10:14:27 +0300
From: misha.zavertkin@mail.ru
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zavertkin <misha.zavertkin@mail.ru>
Subject: [PATCH v3 2/2] gpio: realtek-otto: add pinctrl support
Date: Thu, 20 Aug 2026 14:14:10 +0700
Message-ID: <adce57b3797cae6f6a3486eb1d21c33be61f14dc.1787209558.git.misha.zavertkin@mail.ru>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1787209558.git.misha.zavertkin@mail.ru>
References: <cover.1787209558.git.misha.zavertkin@mail.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9D7C1672FFCCD5B1617B3B0DE5B4B3B1F615327A2213A14411313CFAB8367EF908E2BE116634AD74DAC267584CACBACCCC7D0F6C13AE99213D55AF7CFDC896A0416326CFA1ABCD31E65B98BC17AE4ABE7
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE729E6537B8C47FA6DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566590F97DEBB4E5ABB65541B04889401774091168C272C5B7FB68C1950CD622FAC8EEF46B7454FC60B9742502CCDD46D0D241FAFF9BB01F7E7F6B57BC7E64490618DEB871D839B73339E8FC8737B5C22498CC5112E3E56BCDBCC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C008ED818AD11EC8E48941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD269176DF2183F8FC7C0D5BA9981340F78467B076A6E789B0E97A8DF7F3B2552694AD5FFEEA1DED7F25D49FD398EE364050FB28585415E75ADA92AE38A8E97BAFFB1B3661434B16C20ACC84D3B47A649675FE827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B73C48AADF8AB94BB75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A5ACEFCEE32C544FB15002B1117B3ED696BA90361587933E03B74D9144D44E4FCF3610D81D389A125CDE35189EBF2DEA28FEA14CD2CD220BB99C5DF10A05D560A9880EC71AF561E0AAD9143641EC25BB3905A8BD9291DE3CBBF36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D548E8926FB43031F38
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D6594982113A9EC3D124D8232E731BB7C0F79857DBBA51E6474B92D4ADCA0CAB61E9A3648CE8EFA8EA8AB8341EE9D5BE9A0A9B0B3CBA8BBD43640E4790DBEBC63501686C9D87AC3BE60652EE4E5D9E54FDA4A7285BF96B6084FC8511FE41C8941D68F571C199C4BE91E79E69A34BD5DD98C9F0A6D2C91ED28CB6
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVd9Ysz+d4RqWGADkv5zbihs=
X-Mailru-Sender: FD65D7C492470CAE6DE451A158873DE6010C1C06DC1B19D08BD48BD36611AD347E29FAEDA63F3F27A61D1BEFAA9392EAF767ED260C4F5E398B67290C0B8F2C0D0ACA136676B1AD1C82BADC8C81B40964835B6B713A4867D9C77752E0C033A69E3453F38A29522196
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B491D8917C1B322829C507F2E4FE1A8EB329D1F32499C316BD049FFFDB7839CE9E9A5E1928F991984150F3D58147000504D28E1157B43E7FFB8F75B62B6E8CB4483362E6ECDBE07B1F
X-7FA49CB5: 0D63561A33F958A51FCA5FF2595A4B355002B1117B3ED6968474CD76D3E0A163477B8DB6B08738FF02ED4CEA229C1FA827C277FBC8AE2E8BB6E4CD11D81D7E17
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ5cYNe9pNstA4BIdV5NVlDw==
X-Mailru-MI: 20000000020000000000000800
X-Mras: Ok

RTL9607C relies on pinctrl to mux SoC pins. Use pinctrl to request pins
for GPIO.
pinctrl driver for other SoCs might be implemented later.

Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
---
 drivers/gpio/gpio-realtek-otto.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index 4a606bad5848..01be8baa25c3 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -393,13 +393,14 @@ static int realtek_gpio_probe(struct platform_device *pdev)
 
 	raw_spin_lock_init(&ctrl->lock);
 
+	gen_gc_flags = GPIO_GENERIC_PINCTRL_BACKEND;
+
 	if (dev_flags & GPIO_PORTS_REVERSED) {
-		gen_gc_flags = 0;
 		ctrl->bank_read = realtek_gpio_bank_read;
 		ctrl->bank_write = realtek_gpio_bank_write;
 		ctrl->line_imr_pos = realtek_gpio_line_imr_pos;
 	} else {
-		gen_gc_flags = GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER;
+		gen_gc_flags |= GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER;
 		ctrl->bank_read = realtek_gpio_bank_read_swapped;
 		ctrl->bank_write = realtek_gpio_bank_write_swapped;
 		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
-- 
2.54.0

