Received: from send101.i.mail.ru (send101.i.mail.ru [89.221.237.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F5A457E69;
	Thu, 10 Sep 2026 21:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.221.237.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789075801; cv=none; b=WMKaTwJ8eGGTyGbLBkvwqH973bEDtWSY2jUtk8Zewzdy3PFYLVVBru7ruUKokGnIUQdk7OQtzXmbfnghUIpA1TdHQ2Yh+3MNLUlEmkIwTb1ZYkj9ButV1OlI24XufWZTxoD2J9c7zmUq9AXc9UeMf0iktl/O1QE2eFYv3+I4rwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789075801; c=relaxed/simple;
	bh=7EFGNJLgtMdHJBVbzOCDrno2UDDgic4EQ0WIsgKob9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzz+7s4ll13VtXQW6VslPpGjquounXw8Z2NTDbYSugjWNdRpxRm+prDsmbaChnpWI7sjNSqrvzqxxDHZt+KAtGg6K52xCRmerqcyuSgIycxW/P5as6ZYFKk0MsNyvxlIYXkFc5eu8EH5fneJZ5eLQA/aUpPlEmUNY1qsDrvyRbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=QUKAPJzX; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=Syt9GFq1; arc=none smtp.client-ip=89.221.237.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="QUKAPJzX";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="Syt9GFq1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=M5/ZdFs6G+JwukJRaChnMAhq3ufA8+AY63Lxvnse6vc=; t=1789075797; x=1789165797; 
	b=QUKAPJzXNoNbMIY8H1y37ZMVekF3TU1rT+7kPirRnNGYUH3U81s1TVj7g2Yp80hLixbkhSuU9hJ
	xpc0BBEyacSluCA5d/OJAy66IIDNS3V9e65hOpPw0hyCX/IoHLXXxsVNTrJhMxZpnZyk4JiRCCrHy
	4LWlr+iZyYi3pWQaX72z0vpe8lnekixHKVtEmF1saDyaR0vVTk08cpHYNEu3mj/hTzGrsEr3N80ux
	kQrzZ4MMlEReW93/itEM2he1nvWTKp6D4bfxCQaEa5ref7te4UWmdozJBWQjGjkpGGu38JRyaM6cn
	+HiCxQz34bX1S/2mwuH45OM+5N3iRyvrW6RA==;
Received: from [10.112.206.51] (port=49732 helo=send35.i.mail.ru)
	by exim-fallback-679568fb9b-cgblr with esmtp (envelope-from <misha.zavertkin@mail.ru>)
	id 1x4mL6-000000005IE-1ems; Fri, 11 Sep 2026 00:29:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=M5/ZdFs6G+JwukJRaChnMAhq3ufA8+AY63Lxvnse6vc=; t=1789075788; x=1789165788; 
	b=Syt9GFq1XvoJMPvq2Y0pOjJXcB/Kbkelcukln2rWh2ku3+w4LECIXKbjlpF2TzK9FAYbGEE4r/+
	tjyhaPhCwZUkfkk0+SwhZSolGGmIosNjPgk2JsL5c8DhbDDdxcFgR+r/AOvwOtGWHcYBgGScNF8du
	HeaE+7Axfel13RoJZLwfxaDslcdQGxO2REG8SLF1k/uKVN0mv+3aCrmibW0NOh8leNJgd3HalDJk/
	4NZ7ILS9j+LseqTk/SCd95+FAcikbKd4eoN5rgvd34XHgZeNI7zJ0J2YIVNrrfsaBHX1kS7Dc7TGt
	b20FNGRXv+aPn1Is62QB1nEnzCgGAJfr9Vwg==;
Received: by exim-smtp-569b45c49c-vlj65 with esmtpa (envelope-from <misha.zavertkin@mail.ru>)
	id 1x4mKt-00000000CoV-301E; Fri, 11 Sep 2026 00:29:36 +0300
Date: Fri, 11 Sep 2026 04:29:33 +0700
From: Michael Zavertkin <misha.zavertkin@mail.ru>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] gpio: realtek-otto: add pinctrl support
Message-ID: <aqMhPQpDPJ_J7n1V@gamepc>
References: <cover.1787830440.git.misha.zavertkin@mail.ru>
 <adce57b3797cae6f6a3486eb1d21c33be61f14dc.1787830440.git.misha.zavertkin@mail.ru>
 <CAMRc=Mf16PBE0=Udm+A--i2d1VoZCEC1=LNC2q=t8BwqtgZY0g@mail.gmail.com>
 <apgeSVMUQlwqFGEa@gamepc>
 <CAMRc=MfTTZKBRPGWi3Bu8n3V0y6TN6TR0izdxZ=Zt0mM2eN+_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfTTZKBRPGWi3Bu8n3V0y6TN6TR0izdxZ=Zt0mM2eN+_g@mail.gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9344F665CF1C84C29C1B1043BB2B67B67822F752175909D07182A05F538085040115CC57DD1BA3AA33DE06ABAFEAF67050EF52EF8D72CA0D927F81055F1E8DD1F4AADF9F6CE649D98
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7227E4400968B082FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566A08549CA5D9647611DC7E293A31A7CB9D2E34ACAB02B80CBA5E024749B0F422F8EEF46B7454FC60B9742502CCDD46D0D4E7D9683544204AFF6B57BC7E64490618DEB871D839B73339E8FC8737B5C22494854413538E1713FCC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C091DAD9F922AA71188941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD269176DF2183F8FC7C096C9B5BF839F39F6D8FC6C240DEA76429C9F4D5AE37F343AA9539A8B242431040A6AB1C7CE11FEE35E3BF8C76DC23F74BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE75E4120A18BF8FD0B731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A56BE93B2663B6415E5002B1117B3ED6960DEC0DA5BFCD0D9FE772F934B9BCD185823CB91A9FED034534781492E4B8EEAD543F342AA183667FBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE1918E10F71CB4DF9F96AB70F9BE574AE9C625B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D65937C5AA88F79D82D0410C956BC7B6A8AFAA9BBB85141980BAB374E4C7765BF98C3B80F2335B61517EB8341EE9D5BE9A0A2CCFB2D5F3057899A8C86FE4E44269957DAF55EC7FDC349C52EE4E5D9E54FDA4A7285BF96B6084FC8511FE41C8941D68F571C199C4BE91E79E69A34BD5DD98C9F0A6D2C91ED28CB6
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4Zrk3igikrdHlWEssXJwuOaRcl/VZul3y37o=
X-Mailru-Sender: FD65D7C492470CAE6D6F289AB67699DD68EF15A5A331D24FB951B70A5BD4BD8E9CF0DC132E16D0BBEA31111DDB2986FB4B2A3C715BC1DED96EFAE8183A2EAE0D96DD28E056F58A23E3C55DE776B662A1DD77B849F69637CB3DDE9B364B0DF289AE208404248635DF
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B41153A78F4023D79834203D6D6CF93A9271190DCD2B41B41568F3CF0E9FE49B697BB15FB09B4F134443CC94A79F659AEE2F30B760C6B95F364A76CD8C8DE44B846D2B54FC6AABC6EC
X-7FA49CB5: 0D63561A33F958A5876136146B5A9ACD5002B1117B3ED6961CBF1CA798BA77936A798FA66DF72EC902ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpLaIlvAR6h4id02YH9mgeCTAyYoNlVO8a/mge5WbOvyy0SDhjhkluhU=
X-Mailru-MI: 20000080020000000000000800
X-Mras: Ok

On Thu, Sep 10, 2026 at 02:11:51AM -0700, Bartosz Golaszewski wrote:
> On Wed, 2 Sep 2026 15:02:01 +0200, Michael Zavertkin
> <misha.zavertkin@mail.ru> said:
> > On Wed, Sep 02, 2026 at 11:27:50AM +0200, Bartosz Golaszewski wrote:
> >> On Thu, Aug 27, 2026 at 4:29 PM Michael Zavertkin
> >> <misha.zavertkin@mail.ru> wrote:
> >> >
> >> > RTL9607C relies on pinctrl to mux SoC pins. Use pinctrl to request pins
> >> > for GPIO.
> >> > pinctrl driver for other SoCs might be implemented later.
> >> >
> >>
> >> So for now shouldn't you make it conditional on the compatible for
> >> this one model?
> >>
> >> Bart
> >
> > It might, but enabling it for all will spare time if/when pin
> > controllers for other SoCs will be implemented. And it doesn't change
> > anything if pinctrl not enabled/provided for them.
> >
> >
> 
> Sashiko claims otherwise[1] so I had a look and it seems to me that it's
> correct saying we'll defer indefinitely for GPIO chips not backed by a pin
> controller.
> 
> Bart
> 
> [1] https://sashiko.dev/#/patchset/cover.1787830440.git.misha.zavertkin%40mail.ru

Already addressed: https://patch.msgid.link/20260820-fix-gpio-mmio-pinctrl-v1-1-62c2d7dd4903@kernel.org

Tried it myself, without that patch infinite defers happens if no
pinctrl provided. After patch applied probe loop doesn't happen.

