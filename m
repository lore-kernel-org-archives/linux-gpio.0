Received: from send215.i.mail.ru (send215.i.mail.ru [95.163.59.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA483B71D2;
	Thu, 20 Aug 2026 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.59.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210986; cv=none; b=VWK3HUlEiPrS6jDQ/mjYYeE7iLpuDt0hEKb34CDFmbEJQli1u1+MsqX8Ymdte/yTryX7WP6Zw8Ty81nkTWv3Hjkhz/4W+4BpRHi6RJAfUu/kaZtYNfxYkkGmdRwN1Gnxj3VFF+B7FQ/5HWNps20PXRT1hDXaFQMSODstIWjdrt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210986; c=relaxed/simple;
	bh=PpKGOmLNKLNPkxgaFc3Nm0RMZr+8AadbpVDd+ycVVyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cSDNYkyEptlujgaKCrIGd6upg5/+qveb4Qbsz/L3x3NPo9AUyp+Uwdz615rxjPYm4wbW8WTUXnsaJKc++NepP5X0V0WtDAWtAddc7+BRnbqTXTWKKG78wd340Ss8+5sv3K0jAWSid1KVVi0lC4STMYGV8mJCQEOyBraUVD/Eypk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=gzJyWKZx; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=zsOyxkDf; arc=none smtp.client-ip=95.163.59.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="gzJyWKZx";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="zsOyxkDf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=I8vtwRF3g2YcpSYgZI/Gm8sDuuDLHRj+FdOBDNW/3Ak=; t=1787210982; x=1787300982; 
	b=gzJyWKZxyj1rnw9d8KLO/InI0cqEyI1FgjyomGThwfjXV667JE3Q9j7EOY60OGcjwszPZq+owAm
	7uLDQi7ccYKmQcXUAV/Pq8mqaMgdqLWthpPEdYmRL0WNhZ0D6lmaB+cyNNw15H5uguvvNuvHvmvJs
	v11H2e5ouhqGRWJMkmZpwP6Elq/9UC38nH0ogEJejuCf1heMhaeORQZENxJM8pxgTL4pjR4Q+K0tp
	SDFSDpbdKzHecO67L8YBeiaCF+OqbIoL4PTTz5AX96+8+drT9ldXGHXM78Y1Hwo6Mbm2yNsLaDRMf
	q23r7DmfR8/X8J0KyDdvHqb5Dv3liOYWBMhA==;
Received: from [10.113.144.85] (port=34946 helo=send151.i.mail.ru)
	by exim-fallback-cc5d6c65-2rlgt with esmtp (envelope-from <misha.zavertkin@mail.ru>)
	id 1wwwyt-000000008nO-2zJc; Thu, 20 Aug 2026 10:14:31 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
	To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=I8vtwRF3g2YcpSYgZI/Gm8sDuuDLHRj+FdOBDNW/3Ak=; t=1787210071; x=1787300071; 
	b=zsOyxkDfaohcLOsuwT8F4CydnNV23JWTOYK7vaiNKZsF1hRHQwkrQGgc0yV/7dVpTtMqUZsxlC2
	fgJHaRRrywUnvP7kJX0eSk6fwE1l/BzznkDDtDSC4SmTnR1+1dlmFu0rh5yU8DmOmH+HoZ6Hgw7MA
	w+vwZekNYzAr8yWI/dIrMlGHm0TTonnC0oZw8Nm24FqUVZ8UnmfP07eYVtB8gEBTQNj0KaH0cYs3W
	pE3aTsz0v19Fe2XlmWaOdN3hfTsqVSlKTt3zrshaC3h53KXOfRQvgjkqwUNriHqhkQ6jBB42nHJqH
	bG4Nd4lv6Ae0GpGQya6jiCFijv5zG9jDbGzQ==;
Received: by exim-smtp-67896c5f6-q664q with esmtpa (envelope-from <misha.zavertkin@mail.ru>)
	id 1wwwyh-000000006MN-3Ai3; Thu, 20 Aug 2026 10:14:20 +0300
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
Subject: [PATCH v3 0/2] gpio: realtek-otto: add pinctrl support
Date: Thu, 20 Aug 2026 14:14:08 +0700
Message-ID: <cover.1787209558.git.misha.zavertkin@mail.ru>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9E3E322B45F7E2823FE3CE8CE7DCF5005FB0A6C5E7030149F182A05F538085040F107F0AD48AE6EAD3DE06ABAFEAF6705A001D9E0ABA1315A7678CA4A5D6BD0E94E779315AB36DA6C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7DB6A86BDF2D5A895EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371D5B197C6EC5B4BE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2AA36B8AAB1F02DF52E070BE324C7D3C4D48793A239D7A554BB0A4F435E46E6718B35066C979671628AA50765F790063783E00425F71A4181389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C084ED00A64A654CBE8941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B69EAAB76869E07C3ECC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8D32BA5DBAC0009BE9E8FC8737B5C22495C55B3CE9220558776E601842F6C81A12EF20D2F80756B5FB606B96278B59C4276E601842F6C81A127C277FBC8AE2E8BC3A6C3062C32747B3AA81AA40904B5D99C9F4D5AE37F343AD1F44FA8B9022EA23BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE493B89ED3C7A628178179C543ECCDAE434EC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5F2B513D31C1415FC5002B1117B3ED696FF9C7ECE95692E2A03803A57F48E4E5A823CB91A9FED034534781492E4B8EEADB73CFAAED92B6E13C79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE1918E10F71CB4DF9F9677DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D6598F2388B687C280451EA13D9C48697486FF16323B85B835B4CDD31099B893CC5A7C8F7B89E25F6D80B8341EE9D5BE9A0A05D03AE814A9B30B2B3A8C0DD3BB691CB53A1D7E37933A4852EE4E5D9E54FDA4A7285BF96B6084FC8511FE41C8941D68F571C199C4BE91E79E69A34BD5DD98C9F0A6D2C91ED28CB6
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVd9Ysz+d4RqWAN1CqCSphOs=
X-Mailru-Sender: FD65D7C492470CAE6DE451A158873DE6010C1C06DC1B19D0E693A2F4CD4B10008E5C8980A18F85368D81189B1342F13BF767ED260C4F5E398B67290C0B8F2C0D0ACA136676B1AD1C82BADC8C81B40964835B6B713A4867D9C77752E0C033A69E3453F38A29522196
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B491D8917C1B322829C507F2E4FE1A8EB3B9750D409883F187049FFFDB7839CE9E9A5E1928F99198410059769BCA9CEE61E71634F47D6C15F4EA900EACFBD5D9ECFE971A79CC1EF378
X-7FA49CB5: 0D63561A33F958A5ECC906F6086CCEC85002B1117B3ED6969C1083A2381A1BE2393D891B5189421702ED4CEA229C1FA827C277FBC8AE2E8BED5D45E6452CD47B
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ5cYNe9pNstBDWC0la/4ZPg==
X-Mailru-MI: 20000080020000000000000800
X-Mras: Ok

This series adds pinctrl support for RTL9607C and referes it
in documentation.

Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
---
Changes in v3:
- 'gpio-ranges' is optional in dt-bindings
- pinctrl supported for all SoCs (no-op if disabled in configuration)
- Dropped Reviewed-by (patch changed)
- Link to v2: https://patch.msgid.link/cover.1787130560.git.misha.zavertkin@mail.ru

Changes in v2:
- Add 'required' property to dt-bindings
- Dropped the ellipsis and added Reviewed-by
- Link to v1: https://patch.msgid.link/amRpvtNAwIQak_9y@gamepc
---
Michael Zavertkin (2):
  dt-bindings: gpio: otto-gpio: Add gpio-ranges
  gpio: realtek-otto: add pinctrl support

 .../devicetree/bindings/gpio/realtek,otto-gpio.yaml          | 2 ++
 drivers/gpio/gpio-realtek-otto.c                             | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.54.0

