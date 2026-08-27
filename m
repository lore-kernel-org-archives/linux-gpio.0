Received: from send55.i.mail.ru (send55.i.mail.ru [89.221.237.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDE812CDA5;
	Thu, 27 Aug 2026 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.221.237.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841907; cv=none; b=FO6o9+VKB9x+t8pfEiKsIqZJO+prKogyE408j/YheuiOaoSoYOQJ561WKxvvS7eq+B1Cqb61diLLxKAG5Eu6RaG0GUdPPm005sZOPC1W+r0uALLHPQUmVFDHG6ry2zm3dgjUjMHNTBd22IjcPdgc5heI3OweoCakLTOB9xSEZko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841907; c=relaxed/simple;
	bh=5exYMJ9xI+g63J4xoW6K9/j1K6iO9k7BMQiFP9P5/o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l09hsB1cOt4L38nllSJcgew6MXZPxoc8vAr2LEHdMbiS8opT5ykgzcys+qiX9ZNqS4dkXQUqzeHcjnPgf6BvZbL2HhnEIgiR+YdHv3ifwd02p6ZVFUzQbCXBmqImaHgcK+kpZdAqm/qDcpRWIk/ZI53HbDIkQ5LtZ/llSoGvJPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=Ndxu20Ag; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=EG+/aqxu; arc=none smtp.client-ip=89.221.237.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="Ndxu20Ag";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="EG+/aqxu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=E0vvJPAxMbhZHnYFNDaN2pOoHXfMWSwnBBICu6tVsp8=; t=1787841904; x=1787931904; 
	b=Ndxu20AgyTCzXxXzG6MNT72IdV40RdhycAnofBNHvJRHfIUt13MrPnpZFE50iW9mgZnkv7mlYoY
	SfIjQ1vz1F5sm4AGvkJLldytfrJPovrJyqV2gdHaMtjw8tMuCw73tgA5vQs6h3A+248nf+5e67i/Q
	xbhbFTvCUk1WlTTRxLQ5KBuGqA/sL34APwqfjSwpWuwd9S0bOAoW+wAuuRPvp4Jf25dd4H7XhYDZo
	7VShHh5ewNypzB3BCHszheyk/HuBW4TmZKRwtQ7l0O9H/Nkd+DMPtoI7j3vfDYfeusa1Yla+LraeW
	k/5XgBUTKCMaxNve8XtplJTVrHH6nG1HSGsQ==;
Received: from [10.112.206.62] (port=60612 helo=send197.i.mail.ru)
	by exim-fallback-cc5d6c65-5pw89 with esmtp (envelope-from <misha.zavertkin@mail.ru>)
	id 1wzb72-0000000076r-2qSS; Thu, 27 Aug 2026 17:29:52 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=E0vvJPAxMbhZHnYFNDaN2pOoHXfMWSwnBBICu6tVsp8=; t=1787840992; x=1787930992; 
	b=EG+/aqxu9miQNZH6NIX8uLhNe9czqCU50cAPVDy0ZQb4ZSYQ0Q+9c2BmISWvjCSJnnGpiqK9Tq+
	ijPW+2EnNAd53M6mtCJPtWAzVFYrBpA126nsktom0BOouqE8RqMt2V0gd2GuX4RmmiUArc1+hvH47
	O53ucp0GR+hlXtPHH3HOd6dyx7406IuFIL2HtYFt9NCuLwvNFJArNr7Qhhb/mUTNPxggMRVpT++za
	oNoCBokgahhpLnaghxsVP6eC//PGWXmkDPgOc2YtjTbhAI6cYOUpy1PXGxDGdV/IezHI7n+Z+3XCw
	PtNGZL0p3MODtdIp8w0AUXPZzoSba3pgsstw==;
Received: by exim-smtp-67896c5f6-ccr47 with esmtpa (envelope-from <misha.zavertkin@mail.ru>)
	id 1wzb6n-00000000JcC-1t5I; Thu, 27 Aug 2026 17:29:37 +0300
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
Subject: [PATCH v4 1/2] dt-bindings: gpio: otto-gpio: Add gpio-ranges
Date: Thu, 27 Aug 2026 21:29:30 +0700
Message-ID: <bd1fd3ab47001c303e62d331486779c2be6d6eb3.1787830440.git.misha.zavertkin@mail.ru>
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
X-77F55803: 4F1203BC0FB41BD9F3C3C83612863844C555F43638CF11EDEFD3FF12AD1B7E5B00894C459B0CD1B97FAC893242C2E7AF8E7FD94675F335656F849AF09CE23F817265915FB86A6BCFFA673BDF079014B0
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72E4E5201E1C2E308EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B22F6412163A171A4C2E070BE324C7D3C4DB0F90409AAE4C47BB0A4F435E46E6718B35066C979671628AA50765F7900637028599BB38096F4F389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0998E19D2343267C68941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B6AE6B62100CB10EE2CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8D32BA5DBAC0009BE9E8FC8737B5C2249E6D43E8AF76BD49E76E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8BE366410DF6E37CCE3AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4933DA2A60EF0CB5BF9A3CCBC2573AEBDE1C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5121B3DE2126648015002B1117B3ED696AAA8CAC20E405D4EA13BD6A4B0E00B96823CB91A9FED034534781492E4B8EEADED8273DE7764599AC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659167058EBD3600D600DFC9EBBB4938A7FBF79CE26720C3F3FDFE9959E9F6471567582363A4D5EAEBBB8341EE9D5BE9A0AB3F83BB4A812096899B2B2C36E28826946AB18CF71A8702452EE4E5D9E54FDA4A7285BF96B6084FC8511FE41C8941D68F571C199C4BE91E79E69A34BD5DD98C9F0A6D2C91ED28CB6
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVd9Ysz+d4RqWQmLeG72DyeE=
X-Mailru-Sender: FD65D7C492470CAE95745CB8A15E0A69A51BBE932795F37B0045A77C8BEB847D81542BA62892EA458A3B2647B1303A8AF767ED260C4F5E398B67290C0B8F2C0D0ACA136676B1AD1C82BADC8C81B40964835B6B713A4867D9C77752E0C033A69E3453F38A29522196
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B485448333635D8AFAE63F0F36B9B961B1CABE48985D04A68168F3CF0E9FE49B695D37E82B13707AE58B22635B40045A4161BE7BAF871F827BD4FA327B049CE131232B56594611F49F
X-7FA49CB5: 0D63561A33F958A574F9D4BA182101AB5002B1117B3ED696A709A3070C0CA9D7A4BF5FE4F456A23B02ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZOCqjzNVgV4+OvJ2hIEB42g==
X-Mailru-MI: 20000000020000000000000800
X-Mras: Ok

Add 'gpio-ranges' optional property to reflect driver changes.

Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
---
 Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
index b18f8f0ca0ae..33c25df7b815 100644
--- a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
@@ -40,6 +40,8 @@ properties:
 
   gpio-controller: true
 
+  gpio-ranges: true
+
   ngpios:
     minimum: 1
     maximum: 32
-- 
2.54.0

