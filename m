Received: from send101.i.mail.ru (send101.i.mail.ru [89.221.237.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7A523ED60;
	Sat, 25 Jul 2026 08:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.221.237.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784966494; cv=none; b=X8QTjvY7ElS2dyGq5OjibWn7bIu/wQidpmd/lnXmr+c3JueqS3EDe2lKeF+P5GH6JZzOOi04gafDL0GrxHoO4zCOTkeeuTtUgtuLKoQiNKXsOc0xcl852l1f0Q9iJfdkgxYELXWY6cpVkNScCV1NKrB8pKLsCcptmByCDpO6+pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784966494; c=relaxed/simple;
	bh=4aexlwv1t9o0iZ0OSWUpSPGT3XAPRyQmaISuBNvyetg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uq2wQCBSewRSJQFT2oboHMSHbJqy+a7GhHB+xZEBSQnrmqYlyR4a8lbhVjTW9qwplaLADr8w80u87OE6YCD86feFMj3d+nmgCnGJKC3Q4VbnbZB2K1UhtdCb7pTZbano5d6Ts85jpHQjLgK1H+iWIuTG40eZxHh5G0ILcxHun6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=gP8fP8QE; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=gQ/OKTHk; arc=none smtp.client-ip=89.221.237.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="gP8fP8QE";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="gQ/OKTHk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:
	Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=EpuB27FegNGln5cBFhbLd32ugirP20jV7XVii7ZfcJs=; t=1784966490; x=1785056490; 
	b=gP8fP8QEvKVBtO/6UyhpinGG7dGFqqCUV/bsOKnzwDsdoeqOZOfAbkuAsTrJ3HzUmbjDn+s956u
	IYG2fzwurQgzYfdH9KZSVlVoPi5YCnGoTRU8iMLSzeLzxRgPNvII4GhiLjjGb3jUa2c1j+Fq6ojbQ
	wl2LejCkRKRh1OCQZDCljY+GcUDCiQ9mL1MIgRJPOLxtwpMPFwbXaF8fnOP+9a2Vudr4WNpfawsY7
	HIGnpXh76E9oLinV5Yeuru9dHMbOUZck6YOZlGEtFvf4MI+K0zFFZq/S+8zI8A7yCk+5ieZFGBAo/
	brWw7aEMTZs/ZQCODHHPl+MQo6zkFuPnFZcQ==;
Received: from [10.113.154.15] (port=41178 helo=send150.i.mail.ru)
	by exim-fallback-5cf4fc9bf6-b4hp9 with esmtp (envelope-from <misha.zavertkin@mail.ru>)
	id 1wnX5P-00000000GPl-0ooC; Sat, 25 Jul 2026 10:46:19 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:From:
	Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive:X-Cloud-Ids:
	Disposition-Notification-To; bh=EpuB27FegNGln5cBFhbLd32ugirP20jV7XVii7ZfcJs=;
	t=1784965579; x=1785055579; b=gQ/OKTHkJvVGoNYe5iC46f4RgQGkWlhTljN4hVCC7Ga3YyT
	jtb4ZyFnoqPf1vMljjDkHZ86dp4W/Y3wUUv+eQX5m3U4MjOPmNLb/WOmPntjiFTzNj8mMsbkzjZQg
	TV3D9x1VzVpYbJptPTvfbYcgJbIIi/tcUs9bg/2KTXGZGwSxig4QYeOkUdEpd4zmLLXUVSESNcMYx
	gdsyl32OtcXWp9YiJSxC03j7PXJ9MFILpcXPyFjBg/2ABr6+uvY1hh523uOmvUMWiN33mJqp5vjWs
	/51bPwLTZmku9IMeIURWw0kpY3k2cTsldzLy47mzZB30pRndOyN/qjjxx5AZUbrg==;
Received: by exim-smtp-6c76488b9f-g7jfv with esmtpa (envelope-from <misha.zavertkin@mail.ru>)
	id 1wnX5E-0000000078r-1QMJ; Sat, 25 Jul 2026 10:46:08 +0300
Date: Sat, 25 Jul 2026 14:46:06 +0700
From: Michael Zavertkin <misha.zavertkin@mail.ru>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: realtek-otto: add pinctrl support
Message-ID: <amRpvtNAwIQak_9y@gamepc>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD93ED3C6BF6FFA701F0B3D367FDA022B560160F5E35392B611182A05F5380850409A2666903DBBE1E33DE06ABAFEAF670583BA158881A89CEE0A0E08D957D0F191AF7879D52E6103F3
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE73B44982FA5E78411EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566DDF253B6BCADDB790EBA22F3E2ECC320303AF1C04008089ABD394024A1E32A078EEF46B7454FC60B9742502CCDD46D0DB5C78E0E843E24DAF6B57BC7E64490618DEB871D839B73339E8FC8737B5C2249A0EE70D6C4970CA7A471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352026055571C92BF10FCB629EEF1311BF91D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE0AC5B80A05675ACD452896749CDDA0A6D8FC6C240DEA76429C9F4D5AE37F343AA9539A8B242431040A6AB1C7CE11FEE36FF1B927F95F331603F1AB874ED89028C4224003CC836476E2F48590F00D11D6E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F79006370251709C511DE2D0EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A50F06F22B986EFA5E5002B1117B3ED6965DC215C666427CA172305013E4AE841E823CB91A9FED034534781492E4B8EEAD2F8D89FC5850081EC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D65937C5F88828BC1DCB8BD378C6FB8F9000CF654BDC12CF6897C97E917B681A088075600876D587CA72B8341EE9D5BE9A0ACF5B46AAC1545A774D76A86FA7C34EE8F927C0AF1F515EE3C7CEAA0681F5848F4C41F94D744909CE2D653CA06E969CEAC4926F5095E487D6D64CFEF34022E96A964550E41902C4E4
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVWmxowtcrDwU4l0IqTip4y4=
X-Mailru-Sender: FD65D7C492470CAECC472F0E02B2254C2A4264B170680D12B951B70A5BD4BD8E64E70C63659AD5C11C83562A50431E284B2A3C715BC1DED96EFAE8183A2EAE0D96DD28E056F58A23E3C55DE776B662A1DD77B849F69637CB3DDE9B364B0DF289AE208404248635DF
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B486472E5A48B460E48232B7BA1535077B82EC484ED754B209049FFFDB7839CE9E426FEB9BE7554530F461AD8ECED895478A3DB1CBD1A41D43C05C19413C7BB73ED40CA06DC6F23084
X-7FA49CB5: 0D63561A33F958A5478E4F7C7E151DC75002B1117B3ED696F213C15DD36278373C54B0D56BCD470902ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZfKhV6y8n+j/IasNW20hTxQ==
X-Mailru-MI: 20000000020000000000000800
X-Mras: Ok

RTL9607C relies on pinctrl to mux SoC pins. Use pinctrl to request pins
for GPIO

Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
---
 drivers/gpio/gpio-realtek-otto.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index 4a606bad5848..4d594db24dd0 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -97,6 +97,11 @@ enum realtek_gpio_flags {
 	 * range, where the per-cpu enable masks are located.
 	 */
 	GPIO_INTERRUPTS_PER_CPU = BIT(2),
+	/*
+	 * Request GPIOs from pinctrl using gpiochip_generic_request()
+	 * and gpiochip_generic_free().
+	 */
+	GPIO_PINCTRL = BIT(3),
 };
 
 static struct realtek_gpio_ctrl *irq_data_to_ctrl(struct irq_data *data)
@@ -354,7 +359,7 @@ static const struct of_device_id realtek_gpio_of_match[] = {
 	},
 	{
 		.compatible = "realtek,rtl9607-gpio",
-		.data = (void *)GPIO_PORTS_REVERSED,
+		.data = (void *)(GPIO_PORTS_REVERSED | GPIO_PINCTRL),
 	},
 	{}
 };
@@ -405,6 +410,10 @@ static int realtek_gpio_probe(struct platform_device *pdev)
 		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
 	}
 
+	if (dev_flags & GPIO_PINCTRL) {
+		gen_gc_flags |= GPIO_GENERIC_PINCTRL_BACKEND;
+	}
+
 	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
-- 
2.54.0

