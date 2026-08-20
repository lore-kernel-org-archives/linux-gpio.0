Received: from send262.i.mail.ru (send262.i.mail.ru [95.163.59.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB8F33D506;
	Thu, 20 Aug 2026 07:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.59.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210081; cv=none; b=o+p4CVNXMwdU2/Xvx3Sbdklg91P1vkqeTie3WQY42mKEcmWL2DGqNLRK9HJcF3c/Jk0/Jd6ehqfk5+WCSviXLrdt9V9An8KtvT7lSXvM7Xq+wSDpPZ2diU8hvKTk+maaR6Hy21mm40E3vJAOQrg+jQVhgJ0B0Q/4FENIZ4qxh3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210081; c=relaxed/simple;
	bh=5exYMJ9xI+g63J4xoW6K9/j1K6iO9k7BMQiFP9P5/o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JoqCw2rfLF2mCLp1KQ8i87nGbkXs3rx1MXQTRfP77B77rEfvupzfSNunCo3JOD9sbTMOjo6lvqkbB2LbgPpFrAY18rvONCytKgUQ8M6TN5xJmA8zPn5H7WBYj4O6ZGSkIdJI+l978bUG8CiABHLWK3Ca7odtK8CBlZKSlRFNnX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=D2xo6Ppp; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=1+7s82DZ; arc=none smtp.client-ip=95.163.59.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="D2xo6Ppp";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="1+7s82DZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=E0vvJPAxMbhZHnYFNDaN2pOoHXfMWSwnBBICu6tVsp8=; t=1787210077; x=1787300077; 
	b=D2xo6PppFOXjPHhvvEdNG/IsnM+97CXeQA+TOhsBrM7vS32CER5DvSMP40GE+VV6Z6TDSYnWUNJ
	OXINX6EPa+NvynKYv5aws78EDqFe7QJawkNzT/HCV1J3nykxJUbsPnC3zTBB4H7xAjRg/s0omm1Xr
	YYUcVdnanBouyxrs6XciDN094jSvkWQJH9w7CGZB6fC5XVozG7+Z0GsHiZ5d1mOyVdMFOiR5uDF30
	PZi+MEFqcwcTye0HLy/zQSjCbWvyuINakyw9YayRkeQ84Kc8UDryLKPSGGcRlKtR5suwkj9+xu4Yb
	1pLdgcuxu82LUrXoATUr6+xADXGcymFxutjg==;
Received: from [10.113.84.122] (port=35818 helo=send242.i.mail.ru)
	by exim-fallback-cc5d6c65-cpr6x with esmtp (envelope-from <misha.zavertkin@mail.ru>)
	id 1wwwyw-00000000GhR-1y6l; Thu, 20 Aug 2026 10:14:34 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=E0vvJPAxMbhZHnYFNDaN2pOoHXfMWSwnBBICu6tVsp8=; t=1787210074; x=1787300074; 
	b=1+7s82DZJ3F8+aqtRONXd+h3iktfCq+4qhO2ze1YGK9ceAFKBWh8a4RN1IBuw0zuzVyefTnIVgz
	sGmz6lIjecwaCGSE7Ov1FBcg1gF8mWfnLs6m3nn6QEBzwKSNVTFUiLtsXFRlJdY1U63bOTs4J2QhK
	zec58XHrx8sm/72rEXlYHE9yLnzflaH5heueX+PLDXjqTycLz7ZYxyz4AzH8k+5VHbJ5oXtkdOlIG
	A8lV7I4v/jWYjxaDS4T9WfaWB0+OYKmuywbAhCIxvcZ2KL8E3bcovlAwZwWVEkKj7nR+vwCbFoodN
	DsRC/Scj/p1Msx5fwHje+RngHLApUjbZvcng==;
Received: by exim-smtp-67896c5f6-jvs8p with esmtpa (envelope-from <misha.zavertkin@mail.ru>)
	id 1wwwyl-00000000CcZ-2nob; Thu, 20 Aug 2026 10:14:24 +0300
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
Subject: [PATCH v3 1/2] dt-bindings: gpio: otto-gpio: Add gpio-ranges
Date: Thu, 20 Aug 2026 14:14:09 +0700
Message-ID: <bd1fd3ab47001c303e62d331486779c2be6d6eb3.1787209558.git.misha.zavertkin@mail.ru>
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
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9E3E322B45F7E28236E967E4D10342F1831ED0651C63AA0BF182A05F53808504035F9B2CD21C99E553DE06ABAFEAF6705A5F8309B76A0D0157678CA4A5D6BD0E9261E30AE1A3D80FE
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BCC85671EC7A750CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B224E99C5DB5050ED92E070BE324C7D3C407C2DCE565509673BB0A4F435E46E6718B35066C979671628AA50765F790063767B9C6E70FBE8DD8389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C058C1844A7A85E7B68941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B69EAAB76869E07C3ECC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8D32BA5DBAC0009BE9E8FC8737B5C2249C2DE32F7C1AA431B76E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8B1D9A11CA0D2880DE3AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE493B89ED3C7A62817816B0B6A749F1976AFC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A578FB71A7F4F868415002B1117B3ED696DA594E0A7A27C1F1361FAC1196A180DE823CB91A9FED034534781492E4B8EEADED8273DE7764599AC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659383C08411FA4C597301310FA0C893EE93B7CA6E14E87E0FC810D46E2D8963A815C8F986DE618A273B8341EE9D5BE9A0AF36F0E3ACD8E64CD2742BFB9947CD2EDBB483AE955F657E352EE4E5D9E54FDA4A7285BF96B6084FC8511FE41C8941D68F571C199C4BE91E79E69A34BD5DD98C9F0A6D2C91ED28CB6
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVd9Ysz+d4RqW+aByBm9u3Zo=
X-Mailru-Sender: FD65D7C492470CAE6DE451A158873DE6010C1C06DC1B19D0CFE9FA76EDA5B4B75EF75CCBBFDDB42A921FF226787AE004F767ED260C4F5E398B67290C0B8F2C0D0ACA136676B1AD1C82BADC8C81B40964835B6B713A4867D9C77752E0C033A69E3453F38A29522196
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B491D8917C1B322829C507F2E4FE1A8EB3512C4774CF7C0893049FFFDB7839CE9E9A5E1928F99198410975696522BF96E15F87680FACCC2CEC7B785EAF6A4386E32D2B97EB35E4C36F
X-7FA49CB5: 0D63561A33F958A5C53825F443F9547A5002B1117B3ED6961E357C5B2FBA6417F60D80CA342864C602ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ5cYNe9pNstCc2mCzyXTKwQ==
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

