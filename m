Received: from send262.i.mail.ru (send262.i.mail.ru [95.163.59.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69A43C1085;
	Wed, 19 Aug 2026 16:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.59.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787155631; cv=none; b=tfeWHHamn6Z8nlDVUlGpFNVA8vm21skpR97OvcTwiCTgKflpCdAb/s4Jy7+HSd6TCTi/2Tqhk/PaEr7wqXAxuIuebQeaCMSNyYxIfNLgEJehIBjv++jb3nMZXZhJUMDwiWKRg6KAwRoEPxpLktycxx6JImcbuFOnfLBequFy/98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787155631; c=relaxed/simple;
	bh=hkOSak418feqYht76fGHdD+BIugc+XKW42DiySFpRo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TLQWSeHP8ybkoElGXj+wn/2l05dIygHFc6RZEi69i8tvzTs+nCfOfm4SsJnBVievFfb/mr8Ftwg9ardK7UghGq7XBra5bbg5liIUV8AZ65ZWH+zjDz43Vo8MELYI2qgw2H+lNjplhocXdufcxBThFTN2PeeWdkBUuk7vCX4m004=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=o4IUWfMX; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=CLerriKh; arc=none smtp.client-ip=95.163.59.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="o4IUWfMX";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="CLerriKh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=Ta/fdrkaYu2m1w7FTKWSk6H/n4Rh9BFhhUJuCTaHeXY=; t=1787155627; x=1787245627; 
	b=o4IUWfMXaoP5w+dRKoPHiYq3/jMgzSUo/JJIDM3TY/6dSu8/8Gta4LyQV7WxSwZYUCuFdqYcZdo
	tt3Db7wEnpCNiF1P6oDEqK1wC3lTfQlFM5jkUGzqgo9zX5orbQ7A5W9Syzl0THwdSmpxsaQakPr2W
	qzl63Yc4vu0uHdvoMKkVHic917W9+Y9oA7Tcqci13tlibosSn00K2FOvl9w7Dm53m0tcnJE2yCqu/
	/JmyGrO8Luj9VoDH5XShHQyq22Yh3cEfPW00G2XZ60jr2ToHY51+CEzy5v9aBIqVum1Wlig4LG/vb
	EZaa6nvWdCSUSD5A/84/LSpqAsp13rZ5IBaw==;
Received: from [10.113.164.116] (port=43440 helo=send60.i.mail.ru)
	by exim-fallback-cc5d6c65-54cf6 with esmtp (envelope-from <misha.zavertkin@mail.ru>)
	id 1wwia3-00000000KI3-163C; Wed, 19 Aug 2026 18:51:55 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=Ta/fdrkaYu2m1w7FTKWSk6H/n4Rh9BFhhUJuCTaHeXY=; t=1787154715; x=1787244715; 
	b=CLerriKhPxBrqVflrUJyKaU5w/5zPFcYsQzxwAPJtEOEHq/jDA+yA7dYCn0OfLL83YfoB8wwW57
	Y+180cZbMujl1RWyUHv7aedVy7OkAGa24Ttmz/JhTC2KxzpsJyBTsT8ayRKVrwMeKq0B5qOlZcm50
	sggFBBtT6DGQN1Sx+9Z03WOzGcbAagP0nE5Xa0xegfV7Ne1ccuP2ne+3l3K/iE4RKmXwUdSLEyacn
	RaO5eMdQDb/CvJ01DcrFlxr7aTfXVrkX5XsYkENxsZcuZSK8/RknoXcCeeJ7uy5PNE3BuDzU5H/rp
	a2TgkhqnoikVNxECmPGxNKsc+2sP6QIcd35Q==;
Received: by exim-smtp-67896c5f6-hdksg with esmtpa (envelope-from <misha.zavertkin@mail.ru>)
	id 1wwiZr-000000007Fs-2anI; Wed, 19 Aug 2026 18:51:44 +0300
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
Subject: [PATCH v2 0/2] gpio: realtek-otto: add pinctrl support
Date: Wed, 19 Aug 2026 22:51:34 +0700
Message-ID: <cover.1787130560.git.misha.zavertkin@mail.ru>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9E3E322B45F7E282356DA1F642EF604B77162FED25F202B9A182A05F53808504060424D30A5B9DFB33DE06ABAFEAF67058A869E32BFA8CA80B5CE0CD3A485DC74B949C4EC051D72BC
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE792C68BF9CD4C0E9EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B20777EB149CAF22E32E070BE324C7D3C491B7D631B771DC34BB0A4F435E46E6718B35066C979671628AA50765F79006370277CA7F994D7EF5389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0A633E4711A430BBE8941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B62B7ABF3321926E07CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8D32BA5DBAC0009BE9E8FC8737B5C22497EE09137A9F210E376E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8B590D9E8A242F28803AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE493D1AC325EA934333DF43AACC0BCEB2632C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5907A986DE53E4F675002B1117B3ED69658EFEFA84A285CD3A13BD6A4B0E00B96823CB91A9FED034534781492E4B8EEAD4ECBDE8281F904F9C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE1918E10F71CB4DF9F9677DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659E7987D4445006A23C6F8D94B9428F18AF5973DDE5735D3F5F94860EA3825BFC05EC5CB1EBEEFCBE6B8341EE9D5BE9A0A7D92D7AD2B917668B2082C1D71697EF07A0C5FD05CAA021B52EE4E5D9E54FDA4A7285BF96B6084FC8511FE41C8941D68F571C199C4BE91E79E69A34BD5DD98C9F0A6D2C91ED28CB6
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVd9Ysz+d4RqW/XYw0/LBekI=
X-Mailru-Sender: FD65D7C492470CAEFECA98C338D0D4607D76483D2110A0C6B951B70A5BD4BD8E3B467FA1AEAB3B2DA518605AA5B4183D4B2A3C715BC1DED96EFAE8183A2EAE0D96DD28E056F58A23E3C55DE776B662A1DD77B849F69637CB3DDE9B364B0DF289AE208404248635DF
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B491D8917C1B322829C507F2E4FE1A8EB3059A3F392C521B6F049FFFDB7839CE9E9A5E1928F9919841B07EF8D5660C836484589CE89BA534DE551E5D4B1FC617081474277EEAEA96D3
X-7FA49CB5: 0D63561A33F958A507090348B8B56F355002B1117B3ED6968838891422AB348A3C54B0D56BCD470902ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ0RYIlnPFovgWGrzP+psfrQ==
X-Mailru-MI: 20000080020000000000000800
X-Mras: Ok

This series adds pinctrl support for RTL9607C and marks it as required
in documentation.
---
Changes in v2:
- Add 'required' property to dt-bindings
- Dropped the ellipsis and added Reviewed-by
- Link to v1: https://patch.msgid.link/amRpvtNAwIQak_9y@gamepc
---
Michael Zavertkin (2):
  dt-bindings: gpio: otto-gpio: Add gpio-ranges
  gpio: realtek-otto: add pinctrl support

 .../bindings/gpio/realtek,otto-gpio.yaml           | 14 ++++++++++++++
 drivers/gpio/gpio-realtek-otto.c                   | 10 +++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.54.0

