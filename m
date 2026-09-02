Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC553E7BA0;
	Wed,  2 Sep 2026 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338277; cv=none; b=TAvZIyUDc+9CAnnA7J1Qgf3nEzNl+NPaa5j1xrWdgGiKxnXPzF2zYQsn88cKPX/h+T0fZaOIchjWcbGArvDmSeT/+0GewjnGKtGkJ8A//wofEwCsNhNehHU5dIH9IxJ27vCdiNIrBsH0iqayS1wdv+TT2/C0WtagpL5AchE48xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338277; c=relaxed/simple;
	bh=mUq1NKP1kM7w3wLboHMj99aKGstkkbr4FcbOlWlzudM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tz/RZ6dBGGLbis6B2qAZSaJ8ZxPgQhRD+askBWIGcIQCyjj8V887Yyr2uNnmHpF28BBWBb9w3WMz2hByE8H4CbfaoujXzLebiD4NTnjJ/WOPZrr0903grq/pfX8iod1+rrlm6wQ5NU6VdoCmR54QEoJOloAQADdC/Z1okTXe4Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=qTCCoyYG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wJS6+/Qw; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="qTCCoyYG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wJS6+/Qw"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 618B4140019E;
	Wed,  2 Sep 2026 04:37:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 02 Sep 2026 04:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788338274;
	 x=1788424674; bh=pxWh6c57JPvLZQHcjbN7tBOqCkuOu0wNZnT/jaAcRo8=; b=
	qTCCoyYGfcuexmQjXfkymQyvVDECxjIbx867Ax4IIQh1YhCWlAw53HEOQMobMdoX
	rZBeQpnuEUeUQWkxIKGaq+OPOPbeTl/7xG9/JaqRhviLyEXHOFakZSSQgeUxBfjt
	vURKo2tPeH5jEmTmkMdXkEOti78E8L3nYaH6fGHW1o/TbAP0xUG8kFjBv448qfyh
	mnFfxZ885Wzx+j3dDo4Rx4hKEZSHIrv1lWUXyVQ7+97v3LMsjMWzoVy0kFmi9C8j
	2UeuEmamD6rRO7Ui2Irf5ypINodmJnxY8lXtQzOVJ+7U/AJ8HgNAE6U9FS4Z1xrP
	dypTgp/OXyHSLFUjdtPjzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788338274; x=
	1788424674; bh=pxWh6c57JPvLZQHcjbN7tBOqCkuOu0wNZnT/jaAcRo8=; b=w
	JS6+/QwctN9rQBJ9VLQqgqFHP3FgLQUZzwBlQ0VwY2CEMUCCx1IaHZ2LCS2StRWm
	5xVhvrECM57v5HYlYMiz5mbBGehzcJuw1lqZUxVNS61KPcaDWlm4IQ7T22yKvvEa
	53l7fril1Gcb7K7xKOPsQxd0Xq45u7/ijqf6mdJgMkc2M0JeRwQf39HbB3y4lFZj
	olTElADLdEQncpoxm6QihFtxy+NviqmMhF84oN/4Moa6SQyGvArjj+IDGwYZR2i+
	MWCEFC3LSHb2N8dPRdTq8bK+jrNwZ3uNnmLJTWoQCDIGa4U5K7QJ2hYCkHE9p7kG
	c6WYD7770/fWYrPLluxQw==
X-ME-Sender: <xms:YeCXasAi8_HShvcwOrCY9XnbtWUYoKBJGMwNkB0L58CLbvkRKJ5TDQ>
    <xme:YeCXalniGb-Rd0H3Z5wGf2wTiXNimladGsC7Y1Wql1S8OEhk7UXhN2BgCzwEy9NPa
    l8pR3wFfRKBU05qFdcca5-5hB25BbzRccVfh7CC8-LjNpvQg6o68y5w>
X-ME-Received: <xmr:YeCXanR3N4GVldEl10rIk7T2qxZuUWvRVOunTkzlcjoI8O9Mni4yyYF6rdwTPr4OSxwttccsLy1YNGbAocYB0N0s0wCWpSI>
X-ME-Proxy-Cause: dmFkZTEhLSo8c+qmnpPDrYkwDUhLiaeLsVwvsscELmFvJWpopJFxNtJ92HpIsuxk5n5kpF
    lRWjP+eYlgL+TWp2lDg2QpN5MGsZlvfLXYjGB7sym5gOC7U6RjxjhRL11s9ZMRQzNMg60k
    JIHenuF9gyvSvtBsIRgtqwNFZGxuavogoztBa8clLJPqZhzpokoUZaDbrTBEiC5v9e96SS
    9dXVmckb2DMeDxLoms+DPeIhFltqC2/mGof/LhXbAevvZgySc9vjRt1pSnSj9K7g4o1N+E
    r8oG5vt/KTshJtixl+XSphTatYiTq8Wo7LlR3l3GxCIzptrmZ9dgOssAM/5FNcIwgCh7Sw
    hgkX8VKhSHx9mp/LL9HL0h0Ova8dopLjR5Q81+OMv8NJcA0cFEcFw5wp7Fdjc5IeE1MNE3
    qs52UcfhMugc4CVARinw0dlNqFPSxGmdOkjicGFH+ry80SZRispsqOGp2uJdF/ARwp69L+
    +HXJppD8UDZ7Isa03FMs1PVmCjDFZSjtzsrMcDiHITB6RkZXSPY+IBlVpyLiWJ2D4XcHkA
    tAByPZ3KlXlNmzhkHymwJrvO92EcGXu9r/dK9dzmtfUGLar09Mgdta0bNHBuKx5MC2w4aq
    +T+iRrmMOPiNrK/9Fz0FKMbhla35g7J4f06f9n1KTJyksp1AOl5Rv/DRcCFA
X-ME-Proxy: <xmx:YeCXapLI7lqJ1uAeOZJdDA1aWK1_jr_M6x4cknKvo7m36wNIjwKccQ>
    <xmx:YeCXat-fMEGirPxnbo6-kK79scAE78_I_nqOESdBr2r3SnR3XfBH3Q>
    <xmx:YeCXajAdvNLZhuMM-z9egzE8pGIPpUjzZj7UadFHPLLPb69NRKNDRA>
    <xmx:YeCXavqRwN8UVUiL807FRy_-bFH0kQoBOkZROWxbVTGNCygyRAJ9Ug>
    <xmx:YuCXanyg3GUEcH2qeoAItAEW5o4-FMGTWc7BxoVbzQJp3iYC3pLY0Q5f>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Sep 2026 04:37:52 -0400 (EDT)
Date: Wed, 2 Sep 2026 10:37:50 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Ceclan Dumitru <mitrutzceclan@gmail.com>, dumitru.ceclan@analog.com,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org, Martin Hecht <Martin.Hecht@avnet.eu>,
	Andrian Suciu <Adrian.Suciu@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Vivekananda Dayananda <vivekana@amd.com>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <20260902083750.GC1116206@ragnatech.se>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <20260831170303.GB1116206@ragnatech.se>
 <65b703e7-e4a0-4046-9d35-7d0ff1057f96@gmail.com>
 <16626ec7-d1ec-4a54-ad1b-a59790cd33e8@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16626ec7-d1ec-4a54-ad1b-a59790cd33e8@ideasonboard.com>

On 2026-09-01 10:43:44 +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 01/09/2026 10:39, Ceclan Dumitru wrote:
> > 
> > 
> > On 8/31/26 8:03 PM, Niklas Söderlund wrote:
> > > Hello,
> > > 
> > > Thanks for  your continued effort pushing this work forward!
> > > 
> > > On 2026-08-31 16:21:19 +0300, Dumitru Ceclan via B4 Relay wrote:
> > > > This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
> > > > replacing the few GMSL2 drivers already in upstream, and introducing a
> > > > common framework that can be used to implement such GMSL chips, which
> > > > avoids code duplication while also adding support for previously
> > > > unsupported features.
> > > > 
> > > > While the normally acceptable and polite way would be to extend the
> > > > current mainline drivers, the choice was made here to add a totally new
> > > > set of drivers. The current drivers support only a small subset of the
> > > > possible features, and only a few devices, so the end result after
> > > > extending them would in any case be essentially fully rewritten, new
> > > > drivers.
> > > > 
> > > > This series depends on support for internal pads, for which a patch has
> > > > been added.
> > > 
> > > It also depends on enabling the streams API right? At least I need to do
> > > so to be able to use the TPG. Out of curiosity do you know the plan to
> > > enable it by default upstream?
> > > 
> > 
> > I do not know when default enable is planned, but series could make it
> > so VIDEO_MAXIM_SERDES selection causes v4l2_subdev_enable_streams_api=1.
> >    I am not sure that such a hack would be acceptable by Sakari or
> > upstream in general.
> I haven't tested with this driver, but in theory these kind of drivers
> should work with the Streams API still disabled. The Streams API is a uAPI,
> so the driver itself works without it. If the default routing for the
> drivers provides a sensible single route, one can use the drivers with a
> single camera. This is what the FPD-Link drivers do (although it's been a
> long time since I verified it with Streams API disabled).

Indeed, but to enable the TPG I need to non-default routing ;-) Nothing 
big I'm just impatient for the streams API to be enabled by default in 
general.

> 
>  Tomi
> 

-- 
Kind Regards,
Niklas Söderlund
