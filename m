Received: from send147.i.mail.ru (send147.i.mail.ru [89.221.237.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6AE47A865;
	Thu, 27 Aug 2026 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.221.237.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841908; cv=none; b=XwRAtBql/Q31HRSWPpVE/q+wVEalnR8cMhrnOrIud+0z+NKARkfecPO9/j6MCY/9RWRXcdWTp847BP/haHh3EOZEohDIPFNoM7DBBV/Na2I+f2dqy5QHpjAH9X/WErb5yZQr3OXPRWbClIJCPTz/2syGOJBfcEVPgvIRX30aceM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841908; c=relaxed/simple;
	bh=III9DD4RJFxOiMBJTA7dulNQyODzWbim2gbISV9krTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFLD4olu4B31K8QUd2y+vbNlJ3yxeupiAid/qlbeNilu2EnTlHbYm79j9R9KFjgLgf1M7uyB5ybYzj3mZoLstP2sbLq1OhPCQIjbYMob6fIiu3RZgOO2tdO3Li5mT9vXLknIpyGVRgIRRG7D1SSf8yjW54X0rp7HPSIcOk68yp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=wPNZavKt; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=ReTRSrmt; arc=none smtp.client-ip=89.221.237.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="wPNZavKt";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="ReTRSrmt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=Lf5H28g8wCJv/ntfYUV0bOXDq6hNp839bO1sadch4yg=; t=1787841904; x=1787931904; 
	b=wPNZavKtAm2oBrItNBNGJfFXFqumsGpnDZ6H4+8SUUBsyf6Q2/+fPfa9nrVqJ/Wd0OH8GqClCr9
	10U1G9pY88WYSKC7IWcQiQbFmrL/mLFPgYygKi59PX6Emn5EyZk5xq2oXX/zpwChtFOlFABeq14vl
	zp1LpWvlyQl5jFliBXITe6X6uF+bI167KSJtkC5+kIsMGwWJEf5vgZUvNwX43wq5/OsL8vlA1IlUx
	8oEnZfvJLCRkIp8/q2uri9panexbXKHwvvEKiLA0J31rDHpZbKa6fgPHDvlECwKUpfUer7CyV+WBe
	sGLSYkLQjoIATPwvZD+vTKaWlCoxpukv63gQ==;
Received: from [10.113.249.115] (port=51580 helo=send174.i.mail.ru)
	by exim-fallback-cc5d6c65-g2rtc with esmtp (envelope-from <misha.zavertkin@mail.ru>)
	id 1wzb70-000000002AE-1CjZ; Thu, 27 Aug 2026 17:29:50 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=Lf5H28g8wCJv/ntfYUV0bOXDq6hNp839bO1sadch4yg=; t=1787840990; x=1787930990; 
	b=ReTRSrmtpAT5kx5IaqdR8VNnaG4gDsD9T+w/LesEKLekADg7Dxnlik0DM8gbcC2pUAjZuExDAYt
	Q1I3wPjXjJsHj+tlCXOp0XhN2gL4FEoCNOMGoFKPP52B1+bh37wYxD5eKWtEpMPHPXzA57MDLoZ4K
	Go7+k/Jrr5LMl/X9A2xq8PJIy2zHruTMpK0WUopZXhX1aZjeyaczKrpcgPuAKQ9ZCHT9fIc02twph
	iHElHOa+A8DmYrYuONBOPbFwwe0DH9OrjX9i7LeRzoL6UWi3eGp4IvzgIaCL3Ju1k3l4flpIiNWoA
	IpTfixE+kuhxjZ5IT8atJjihQDnXxa0pn2xg==;
Received: by exim-smtp-67896c5f6-rv4rd with esmtpa (envelope-from <misha.zavertkin@mail.ru>)
	id 1wzb6q-00000000RL6-2sbT; Thu, 27 Aug 2026 17:29:41 +0300
From: Michael Zavertkin <misha.zavertkin@mail.ru>
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
Subject: [PATCH v4 2/2] gpio: realtek-otto: add pinctrl support
Date: Thu, 27 Aug 2026 21:29:31 +0700
Message-ID: <adce57b3797cae6f6a3486eb1d21c33be61f14dc.1787830440.git.misha.zavertkin@mail.ru>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1787830440.git.misha.zavertkin@mail.ru>
References: <cover.1787830440.git.misha.zavertkin@mail.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9F3C3C83612863844C555F43638CF11EDEFD3FF12AD1B7E5B00894C459B0CD1B97DCD4105A765527203AAE3001806DF104FCA9F0EEDE0C4257265915FB86A6BCF4A43D3E7D3A7B3F6
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7085F8A46B177A11EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566165720108E41FA505E173DCC7611E5C8032F9033EE524EC8AC260B9555E3CAC08EEF46B7454FC60B9742502CCDD46D0D6030639D0DAF385DF6B57BC7E64490618DEB871D839B73339E8FC8737B5C22494280523C145DA091CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0E8801E8C4F941C018941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD2690E30A4C9C8E338DA58EA3B67F1D5C7297B076A6E789B0E97A8DF7F3B2552694AD5FFEEA1DED7F25D49FD398EE364050F1C1080093C09B836E0F2381F647739FAB3661434B16C20ACC84D3B47A649675FE827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B2D678E2D2B35076FEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A572DBA5F118FF20AF5002B1117B3ED696D94A6D5509FE96EE484B8D70797403F6823CB91A9FED034534781492E4B8EEADAEB4DDBFD72C8FA1C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D65911DCCB6DEDC6AFB1D4C3B7288BEA7A168E27FC300272EE8472C98E3AC83C746BB894F4CC25338046B8341EE9D5BE9A0A72580D5F6CC4A3717C3E33BCC1A74864B9170EF3C7D5D04652EE4E5D9E54FDA4A7285BF96B6084FC8511FE41C8941D68F571C199C4BE91E79E69A34BD5DD98C9F0A6D2C91ED28CB6
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVd9Ysz+d4RqW6CIaBgpzwyk=
X-Mailru-Sender: FD65D7C492470CAE95745CB8A15E0A69A51BBE932795F37B0623C2DC5F880BF907A56692A1F09ADCCA964D05DEAC15EEF767ED260C4F5E398B67290C0B8F2C0D0ACA136676B1AD1C82BADC8C81B40964835B6B713A4867D9C77752E0C033A69E3453F38A29522196
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B44E72EF7427BD9C08E5321CD87E45F53017937B926352F403049FFFDB7839CE9ED6DF2CF6B6DF36CDC240EED9BE2D894F0ED40AFACE84C3A4F00587F7B8ABBCFB1FE499864FF0858F
X-7FA49CB5: 0D63561A33F958A58633F8C0712A4B025002B1117B3ED6964E6A7AB8A4134F1AA92FD30A1C74D94802ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZOCqjzNVgV4/zOOaknfrqlQ==
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

