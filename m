Received: from send78.i.mail.ru (send78.i.mail.ru [89.221.237.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A24D3C1085;
	Wed, 19 Aug 2026 16:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.221.237.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787155646; cv=none; b=CLhLRbpXNU/kZbqN4LHkAP9QdaxuR+7kHhoCegluiDuWL1HGsevLPI/aRag9JL7N6/K7AHu3tOTqd1YHqr9+TfWizjtg1hJJ9BSnQHwa+QcuuM1ipbojFEbx85ZeCkJ8b4zSY0ru4Jff9vqK13jWVJjAEGYI8cPEHz+WNiLnIco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787155646; c=relaxed/simple;
	bh=jaNAgDZzCnE9pHB9FxnvZBbcXEIRMe67Xgbty7+bbu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bnopffMYNSLIB5Hyqr8WLzufn9Fr107vc179N1lamVMf6ZL53JLmtFu4OVof1tI7qbgohC4egwb958WeR0gUv1AYrAfwJ+RAPldcccaHrC+slfzhXFrPnjA+Yy9KedYdlR7Z5n83LI5s0leDSpsTYAsDIzwwRagBJFxz1kbR+gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=CNHxS1N3; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=Z8SezlYx; arc=none smtp.client-ip=89.221.237.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="CNHxS1N3";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="Z8SezlYx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=nkO895dvX1ZmogP0dqcq4AMEn6P783jGuDAziRUYiMU=; t=1787155643; x=1787245643; 
	b=CNHxS1N3vogpwIHCCSZRC2I646SrCnjxbjPypgP0nX1PI9uP52k0Uh6CJRQ5qabjl66Djv/nHfk
	8clX23HxGwIh4a5lTW7+oZ1bpIZCzAVXv/PTUn8dng84uGR4Rq7Wc+GNACa7FOdBXrVUAYAAU02BB
	5yAn1hIfXJPukoD5lD8UqoLxtig25+j1q/HcoCxiHBe19Q5Ew7aLfrm36ytknyink5Xdmuy5qNMSg
	ZXt2suKe35LVnFcAhUXXVu8TzFbPqM8xQDn10z6wMCcVs7ZzldGJaR9lVLlok5Ga9EOyc4deOo6BL
	V8HUY4RED9XfycliBJN/grwCOby9CS2XYptg==;
Received: from [10.113.253.241] (port=54026 helo=send276.i.mail.ru)
	by exim-fallback-cc5d6c65-whxg2 with esmtp (envelope-from <misha.zavertkin@mail.ru>)
	id 1wwiaK-00000000Lsu-1uAt; Wed, 19 Aug 2026 18:52:12 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=nkO895dvX1ZmogP0dqcq4AMEn6P783jGuDAziRUYiMU=; t=1787154732; x=1787244732; 
	b=Z8SezlYxpHsTBO18YMdQIRXTC1t34KCDDY7hxCL1lw+VH0y1Y7owmCQ8gqTtnE1ueviVS2aHYp1
	nwaMA9nVob/WHJ4rzeEEgRlAxOhZqh3Po5aMCvDDdvsKdP4Vo8DpNyCK8R0CCEJ+jQ7ClTGa4fnu+
	/76K5AwsaK8prfpEwLSPa/JT7/vUm/mW+iWcKFtA87+Swk1JacIP5Y/DPox9T6u1wlX9X3B5DTl3c
	7uzU2C05HGvC8QDAvAjJNxm38YufB0ZuICy12PVlRDsjdlJsH6ZqF05AEjK9ubQGcW24GPMeSgRzG
	dObLvoPbAqCM84SGaOkVTFM/KLbnPryPaxDQ==;
Received: by exim-smtp-67896c5f6-p7pnk with esmtpa (envelope-from <misha.zavertkin@mail.ru>)
	id 1wwia8-000000002jz-3nzq; Wed, 19 Aug 2026 18:52:01 +0300
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
Subject: [PATCH v2 2/2] gpio: realtek-otto: add pinctrl support
Date: Wed, 19 Aug 2026 22:51:36 +0700
Message-ID: <060486bd7671ce058b96378c7b02316ebbe6d92c.1787130560.git.misha.zavertkin@mail.ru>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1787130560.git.misha.zavertkin@mail.ru>
References: <cover.1787130560.git.misha.zavertkin@mail.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9E3E322B45F7E2823D07826CA40C10E38CFFF2E4E2DBF484A182A05F538085040FB84BE087CEA73E63DE06ABAFEAF67054C340995B503C8C7B5CE0CD3A485DC7432558796127ABEF6
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE782A779A89F7D69B2C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6759CC434672EE6371C2A783ECEC0211ADC4224003CC836476D5A39DEEDB180909611E41BBFE2FEB2B5CE7222D463AE070E76C348C003783F152E9ECCB24F85B2FF0EE95FF1E41AFDA0C819B32DFABC24A725E5C173C3A84C387AC71952E7BCFF3CC7F00164DA146DAFE8445B8C89999728AA50765F790063767B9C6E70FBE8DD8389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC80A9EC8C3488E7643F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CC96B11FABC3DFD186136E347CC761E074AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C391C2A418F9FB5EE8BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF17B107DEF921CE791DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C37964CC910C88DD5935872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A5413752AF3D2C7B0B5002B1117B3ED69610E0708CA81FCD4C47A99E6294EE8661823CB91A9FED034534781492E4B8EEADF7ED4D6813B5CA04C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659F34B62C2ADBA082F5AD50CDFB5D1FC5E6A21A18E43418822F1882D61B32037DAF7E1083796D119F1B8341EE9D5BE9A0A51239A683B0E7D77EB48F34598009953F2758673C896B73852EE4E5D9E54FDA4A7285BF96B6084FC8511FE41C8941D68F571C199C4BE91E79E69A34BD5DD98C9F0A6D2C91ED28CB6
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVd9Ysz+d4RqWZM8ejrGaS9A=
X-Mailru-Sender: FD65D7C492470CAEFECA98C338D0D460369B246F1D345612B951B70A5BD4BD8EA243CE47B1D0CC8FD07EC8077828DE9C4B2A3C715BC1DED96EFAE8183A2EAE0D96DD28E056F58A23E3C55DE776B662A1DD77B849F69637CB3DDE9B364B0DF289AE208404248635DF
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B491D8917C1B322829C507F2E4FE1A8EB349266869A5679D25049FFFDB7839CE9E9A5E1928F9919841A65AD066669595C59788EC303F1DF7E373526E9B8BBE4E8D217264C48AE27DE5
X-7FA49CB5: 0D63561A33F958A533C1F6FB91372B705002B1117B3ED696711DB8E38B9FC8AA9F6E6D0C7B647F4E02ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ0RYIlnPFovgJvaN2goLEWQ==
X-Mailru-MI: 20000000020000000000000800
X-Mras: Ok

RTL9607C relies on pinctrl to mux SoC pins. Use pinctrl to request pins
for GPIO

Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/gpio/gpio-realtek-otto.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index 4a606bad5848..86948da8adec 100644
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
@@ -405,6 +410,9 @@ static int realtek_gpio_probe(struct platform_device *pdev)
 		ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
 	}
 
+	if (dev_flags & GPIO_PINCTRL)
+		gen_gc_flags |= GPIO_GENERIC_PINCTRL_BACKEND;
+
 	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
 		.sz = 4,
-- 
2.54.0

