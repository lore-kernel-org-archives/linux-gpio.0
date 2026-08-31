Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54A84582E1;
	Mon, 31 Aug 2026 17:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195790; cv=none; b=T5W6Fl8Bd0TsZjfaCKxSDX6AxwUrp5x4dUB2PdGD0MpvBYSdvehoFLKUVSBv2psGR0xg2iTgBbbCubAVq1/fQEcB533CnD3NC7byXCW4itu/IpzSeLOpj8fe3ACf//GAkLNi5OLTal/MgWy80r+HP31LkqhpxqrEv05/zkLfhR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195790; c=relaxed/simple;
	bh=x8pyfOFgSkKTlAfiLszTEL4H/BxUyTuFtU+ZXQQky9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSXmhapGYMfOBgFsXgoJu/yifCl7noXzjHYa2nu9aFQAw9BCNfI2TAd1E0TZKZE5PoKFF5CRUW69t3VLAWPmudS2d8QrMUhJ8r6NtSvv0UsfcDXfI20ewLqJYgnM6uLqnOBMfUUvXLMvrUz/hkc78SBLls8+uUi+x/zAqlx4nxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=AP2QtpsK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a8GhFhFa; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="AP2QtpsK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a8GhFhFa"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id D9570EC018B;
	Mon, 31 Aug 2026 13:03:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 31 Aug 2026 13:03:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788195787;
	 x=1788282187; bh=F0PGnQWaLIQjLgUONrZVx24rLLeTQOG0W5RZFIJrJKU=; b=
	AP2QtpsK5aOcZr/rrUSARIiReC0Ublypx0eTJneMRZgE+Ic7l1kQr4+6tDAhgJVZ
	276PX6q23xuk+yWVwy5zVpHX7kEVPAA1gOmBPqekG1Isa8W51k6Cv4XZ3VdcWJnq
	Zirn02xzkMUJ7AynVeFCFTW2OtaJLG/ZGX46xc/yNRHkMmOC3b2SLJEGi0Fw2pAv
	JhsYyeU5IsriZhNy9q9WsAHVksMnyEZE6QG8wi/H62b3cQpG84Z9H/C7HSKxA18Y
	zFwyfeWOwWqW8Wr0UIhd2yqq7qTsnT7hUpRt7NXmycX5R4Wg70QolyekK40ugsyq
	P4oMw2wht7ivKE2g0ZT0Iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1788195787; x=
	1788282187; bh=F0PGnQWaLIQjLgUONrZVx24rLLeTQOG0W5RZFIJrJKU=; b=a
	8GhFhFa+ruyQDY2Psr/yBZ7Nr9NfVLST5kSr+a17EZtUb0SDIUEh/TUME2DQOKmN
	B4W96Wf4F5CsX3NY3VF0yFMDzcfRWYmNeiopxF0GDd27R1Cwj3eiELXnVYAcGuG7
	VW82ohL76VXl5xjlrPSyVfGTGys6KTT6Uay9t1vx3HziJibO/cbLlMWhf9ZjALf3
	/bOv4q1Y1BepyumfeJaKbQc+BKwHfwgmeOjO8RfT92BUWaD7R1o7ayHUXNLvnHaT
	7KRY8tffDK2HTzc5w0XUt3L9/1AvNVPdfpU4DsFSlam7+TolR+UH6jWWfx7EBz0i
	Ld5AYKGdMW6UCcGiiEMZg==
X-ME-Sender: <xms:yrOVaiO8F-utIg5VUER89kACm2HzIr7aE-SRJfcNDyIBrofS7KYbCw>
    <xme:yrOVaoAjwvZKGuTqfnP-1AfutEdjsbt4rqLYnux7tgC6iQVZPjFKBfsj8bjC3ko-t
    Jo-P2n80NnsbaJxIfz3RtefzYQ8Dkdm-7f8cDG11gngnAErzyIJ5JIG>
X-ME-Received: <xmr:yrOVag8_WEAbLI6rtKtlzzqPPaNqNuE77YQuKnHJmGDRamIjQlrFMD7mG3dQqB4aFoA-CsmXqfB_YVwkk40dzBdi5hxfKB4>
X-ME-Proxy-Cause: dmFkZTGUrQUCuUEYWyf5eaq32XTaxIkIe9jIJi28PlCA7ffFYlgodbkNN/nBhdnOiUg6Nm
    NU8srThnTkQVEXpH1B4GePx0lxalApr7949A3YGNhP1In4d71MS+sgOpTkQWMfyDNgYFli
    mRKetbDnkRJRvksrq0wsF5rlhd9MxoplaXDJ8a8Djlwl5cB8rvhTQo3p1sjbs8qe4oFRCq
    d2pz6FUP8xrNya1wpXlSO21SnB/QaPXbAPbWJlluYnPbnpts3MVK7+U1DkhCgU4RL9p3Uv
    HJDC2hkNx4xW3Puux6CASTL+I7JXHxcDrk2tZXC7Ke3fz1k5oI/xMl66ywPlwEIIyyWLbF
    fLb4uxG8DwOmRywTylH0WuDIcYjihU51Xwm6B5jzesfK1HR+CSfyvLI9M8LoIlimtFBK3c
    OTpn2XdI3WQYnYmypnPTSaZDbSuwnt2NCEVdjbRZwLceFTXGKw/EgjIxOda+0ITemj7Y3m
    cj/b1Z+JBSPI3hfrzi4Yn7SrvAc/nOCsvszK2flf3UHzQVSNQp+mSmINCWztirL5Df3VBB
    +BcTqMNg8cJCW3c7R18OTbTTotmjm5/ICSeKMCmgIidjpxSoz5RPQfRhC12izSyRba/Mja
    +r+NPRGeiqIqKSsp5BVjlzpGqW4cp5jKJI+/8FZzw9o8NDCOBkuCeM1eCsWg
X-ME-Proxy: <xmx:yrOVapEHHZxqvif6osI7rWm8XOzz61lkgQzNAzu-mR-5nNMdV8FPSw>
    <xmx:yrOVanKMjsOS02T84S-6tFwpmO9Dfd4ds3vzaCShH78X0ichQBOAYQ>
    <xmx:yrOVasfpyUjIFj1TgNyhZpZYOsP4Rxq04SVtVsBanjkjpOMSYGVglg>
    <xmx:yrOVakVYpBbYQkAwTajMS8HHPrmszfvf9xOu_M-kRNVo16BgspJ6pQ>
    <xmx:y7OVasP86tyt9IIm-0TGL0Q8Lh5fltDRWk55xoar90CQjDFWjYeA6Lwi>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 13:03:05 -0400 (EDT)
Date: Mon, 31 Aug 2026 19:03:03 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	mitrutzceclan@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Andrian Suciu <Adrian.Suciu@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Vivekananda Dayananda <vivekana@amd.com>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <20260831170303.GB1116206@ragnatech.se>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>

Hello,

Thanks for  your continued effort pushing this work forward!

On 2026-08-31 16:21:19 +0300, Dumitru Ceclan via B4 Relay wrote:
> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
> replacing the few GMSL2 drivers already in upstream, and introducing a
> common framework that can be used to implement such GMSL chips, which
> avoids code duplication while also adding support for previously
> unsupported features.
> 
> While the normally acceptable and polite way would be to extend the
> current mainline drivers, the choice was made here to add a totally new
> set of drivers. The current drivers support only a small subset of the
> possible features, and only a few devices, so the end result after
> extending them would in any case be essentially fully rewritten, new
> drivers.
> 
> This series depends on support for internal pads, for which a patch has
> been added.

It also depends on enabling the streams API right? At least I need to do 
so to be able to use the TPG. Out of curiosity do you know the plan to 
enable it by default upstream?

> The drivers have been tested on the following hardware combinations, 
> but
> further testing is welcome to ensure no / minimal breakage:
> * Raspberry Pi 5 + MAX9296A + 2xMAX96717 + 2xIMX219
> * Raspberry Pi 5 + MAX96714 + 1xMAX96717 + 1xIMX219
> * Raspberry Pi 5 + MAX96716A + 2xMAX96717 + 2xIMX219
> * Raspberry Pi 5 + MAX96712 + 4xMAX96717 + 4xIMX219
> * Raspberry Pi 5 + MAX96724 + 4xMAX96717 + 4xIMX219
> * Raspberry Pi 5 + MAX96792A + 1xMAX96793 + 1xMAX96717 + 2xIMX219
> * Raspberry Pi 5 + MAX96792A + 2xMAX96717 + 2xIMX219
> * Renesas V4H + MAX96712 + 2xMAX96717 + 2xIMX219

I tested the TPG on Renesas V3U + MAX96712 and it works as just as good 
or better then the staging driver this work makes obsolete.

-- 
Kind Regards,
Niklas Söderlund
