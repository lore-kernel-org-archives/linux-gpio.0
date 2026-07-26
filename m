Received: from send288.i.mail.ru (send288.i.mail.ru [95.163.59.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A02530FF36;
	Sun, 26 Jul 2026 15:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.59.127
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785080215; cv=none; b=Rw+/Nf4NyARVT3YQ81J8QyeLsYlxYLIbGgqJfqhUBM1Hxl1bv8T5+8v4r2gwo9iB4EnwRFsMdwtkpG+ldad2p+X+1b7pHVCrFCR8lYmQwkK+CTivcIKuT8CEldGs4qBAGZ1wR9XMkIVkFrgVyZDyQVSgYXrpoMp/MYYNqZlZHCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785080215; c=relaxed/simple;
	bh=1eYw7pHn75ZLXrhc0zuKxbGXFnGubhtIiwqJ65at/kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhW/npU68s+GVM4XUvaOTgNz3kmtew5DzP81iHxnQCq2S252PPbFGf3QQvR8SlEBZ3OshpkwhUf5Y3A1qrdiBBfoqf58YHVLjF06M3aY4wGjfSgLVvrPLWUS0X7+qn0z6Kj7/25jMKt2CLCr8D30TP1Ff5/lDprufmUeysvTpRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=H/teiiw5; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=KRLsw+Ih; arc=none smtp.client-ip=95.163.59.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="H/teiiw5";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="KRLsw+Ih"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=4c12niuMnY3jh4ZHpojSy5mCKUjF4MYnkP0CpvWuN14=; t=1785080211; x=1785170211; 
	b=H/teiiw52DANlZC+tFj2Ga4QXWFecsPC4n3uIFgVJZQXw2yVyFw1bnfhj1fSJ2Zny9EyHUqo9/V
	Y0sudtLeAG9zHvc/VS96NwgWdz2zU0EJGq4PNwv06dFU5KW4HZookc/JKlGA6dNQpfRI9uK9aCjpQ
	bxAD+Ofkx+ceJcgzeSAgrPzusACRKlCbVCdZtpq0vFIefvOgQtwTnDmNhFoPLXJERD/w4yOXEyCRP
	ASiDhdTT17AzSsV/hzolEbXLKXOn56htaWrCcQTTFVvcgeMlubu8/Py9gUyUXJoR2vF14vt7M6zce
	vS7Gxhq5ZFQgXNMLSLezwbqWkgmeLJYcSM0w==;
Received: from [10.113.51.208] (port=47164 helo=send219.i.mail.ru)
	by exim-fallback-5cf4fc9bf6-qqs9m with esmtp (envelope-from <misha.zavertkin@mail.ru>)
	id 1wo0fc-000000003BG-1d9Z; Sun, 26 Jul 2026 18:21:40 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=4c12niuMnY3jh4ZHpojSy5mCKUjF4MYnkP0CpvWuN14=; t=1785079300; x=1785169300; 
	b=KRLsw+IhZ08Z8gwmz/WWLwqnkM1v5YvQufhjcJR1tQNpu7xkAja4x0utbYzPxEqTeFq9RHFX2dq
	pK3KIR5795KaMz1mDCl3ApLCeui09jhMT16cPOObnnHNRV/mni5wHH/hZNTqclmqk869HwEHvsS18
	gQ1P3lWGKo6QEhILUDhOzp3rpLlagOAsZeYewZQ6kqJZO5OshnM+dGe75OfX09M1SI8ffD4a9DleD
	A7/IomblqSYXij1T6T+/u54sxIrkIu4V5La0z6TV60W2+tPFP6JUssin0CJ5ITys5CglXv+3snmYq
	kKsxbUROqrX1Z55xZkF2GSyD69NG1Y4eSxVA==;
Received: by exim-smtp-6c76488b9f-cqjdp with esmtpa (envelope-from <misha.zavertkin@mail.ru>)
	id 1wo0fQ-000000009Pr-430n; Sun, 26 Jul 2026 18:21:29 +0300
Date: Sun, 26 Jul 2026 22:21:27 +0700
From: Michael Zavertkin <misha.zavertkin@mail.ru>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: realtek-otto: add pinctrl support
Message-ID: <amYl90gvP3QSuTcP@gamepc>
References: <amRpvtNAwIQak_9y@gamepc>
 <CAD++jLmXdmgWPenz=2VspSZHa4e7bWYJLyDrWDMjaEXHHKBy7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmXdmgWPenz=2VspSZHa4e7bWYJLyDrWDMjaEXHHKBy7Q@mail.gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD93ED3C6BF6FFA701FE26EF4BD9DEF2C44D65DE1257574BED6182A05F538085040572063B6D17067903DE06ABAFEAF67051D069A133EBB9D5C3CF0047CDF250D18C07AC04938B41EF6
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F65C230EDDCD559EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375666E0AFCC7CBCEC7C73AB4E2122788324F7CE5FB5AE40A775CC968C410D151E41D8EEF46B7454FC60B9742502CCDD46D0D1E44367C8E80A7B4F6B57BC7E64490618DEB871D839B73339E8FC8737B5C22499EAAB76869E07C3ECC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0DCF4F0DC832992758941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD269176DF2183F8FC7C056235C9C6E4B608F7B076A6E789B0E97A8DF7F3B2552694AD5FFEEA1DED7F25D49FD398EE364050F4B6963042765DA4BC8623B8F170C382FB3661434B16C20ACC84D3B47A649675FE827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B015CA81987D179B8EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A54AFA583C7276EA295002B1117B3ED6964A0479A9B37E424C54BB1175C6E7DD94823CB91A9FED034534781492E4B8EEADA3FB0D9844EF8EC5BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34CAB70F9BE574AE9C625B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D6592726F4ABA5C2FB99B68993D8C50FFF93D84B42D41A4D385EE3999C5FE7D22E48BDDB7D9D68F6C160B8341EE9D5BE9A0AE93150793F06EFD8A4832A07EA096334DA8926B9C604152EC7CEAA0681F5848F4C41F94D744909CE2D653CA06E969CEAC4926F5095E487D6D64CFEF34022E96A964550E41902C4E4
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVczkDsfooUjfQKHHrHlL3jE=
X-Mailru-Sender: FD65D7C492470CAE2DCF3D90CEA1D1B26AFF7A7FDEDD9747B951B70A5BD4BD8EB4AA4B51E42264F489609E5FE68F7EA04B2A3C715BC1DED96EFAE8183A2EAE0D96DD28E056F58A23E3C55DE776B662A1DD77B849F69637CB3DDE9B364B0DF289AE208404248635DF
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B486472E5A48B460E48232B7BA1535077BBB28BC3B3BE3FBEE049FFFDB7839CE9EC750E04395D27384BF91DDB90D9B4D505960842545265FF807D273BD0618770712305EC0AEF9F960
X-7FA49CB5: 0D63561A33F958A5309BE20F92EF3BBB5002B1117B3ED696E8E30057A27B32C4A92FD30A1C74D94802ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZD3P/cBGbbcLKnL01ZIRaTg==
X-Mailru-MI: 20000000020000000000000800
X-Mras: Ok

On Sat, Jul 25, 2026 at 04:10:54PM +0200, Linus Walleij wrote:
> On Sat, Jul 25, 2026 at 9:46 AM Michael Zavertkin
> <misha.zavertkin@mail.ru> wrote:
> > +       if (dev_flags & GPIO_PINCTRL) {
> > +               gen_gc_flags |= GPIO_GENERIC_PINCTRL_BACKEND;
> > +       }
> 
> Drop the ellipsis {}.
> 
> With that fix:
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> Yours,
> Linus Walleij
No problem
Should I also add pinctrl property to required in realtek,otto-gpio.yaml
for realtek,rtl9607-gpio?

