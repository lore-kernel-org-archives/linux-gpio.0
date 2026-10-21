Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598719;
	b=2KlSjyV+WBDWR2xkYCVIqxzKyveKKSgd0vbmy6w1noJuGf3EAqAMn3KLX06kUx00rPMm
	 ujZwIkH4VvuynYm/KYENEc5X1AKnBqhEMH0dBu4rDCZMyrFmT8SPgHk8s9Ard4Y9lo0dv
	 xOnMExpQgEQ6Z7joU4LBYoDypDsgD+sXNDUYa6sa81HSMlb2X8Ry/rUV5a6blOqpIxoAZ
	 hL7qDOLowhwhbUUNsWIavcmJD5Qh0l6y6gk1I3A9EXgcxmBb0RLGcY1Tjd1fgHIMYaFkT
	 //DL3z0zUwR8MgyJc/kxPdV6LX0mmzRjF+dEp3s4yUL3g7QsZZtTCmiC1e2DcCm0olg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=OO/jQ74sz4moznSOIcQuGfT4C5O0ZbLQA+114JVzDVM=;
	b=iqGoXkyzJjLoagoR6sKPyOicvLhcPAMwtcEGlR8zv6W3biHFMiSrIfaRu64/g1FbvMVS
	 SX/SDegPbSa/jvSrWR1rajd3bPHQ7f40qc7NgUZ0ccITQgvsZi9mEL6QFBz1BCXUEc20b
	 6rbJfF7iAYPG9nDuLcdMlE9Wmy0+6FZIjsveWvaCgI+ad8a8/6ZN6EZCreR4748AxJa3s
	 awCQmCAXMy7WW3wwAzPSUb6sTdYAlMo4ZCAo4/mPoccg1OiM8UdiihLamLYUWrJcdo+uT
	 uA5nlMwbWv2J74pKVYVsijSP/4qW8q5W68uztY06bvH+lFxaV0CjToos91H2/bj1gXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kC+JIqff;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC33F606A31E
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 16:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC33F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kC+JIqff
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso142980366b.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 09:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792598717; x=1793203517; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OO/jQ74sz4moznSOIcQuGfT4C5O0ZbLQA+114JVzDVM=;
        b=kC+JIqffK4rC46rQzGkmweYrHwrBuORYof+4Q79ymYrFiYUH108zupB7/K+ZHWFvg5
         6xOMEzcIQKk42FqsC9rXViLfn/HI7mrYkiMCwCjy2GLBSIHSe0jlf9ikeluMqB2xJCvf
         wuw08XQMARxGWnTiO3lAYlKBfESmd88wPoPL7a3CpuKi7CYtbUDBE+cz55xyBQx0hlxN
         OHpkYrJGlCPqGb7vqH8696iSHlKSLDP7PRnmkwVILribmC4FvskE5nRy0nKReHoeTeXY
         Ou9d9YdojPlS0rfqT4vfA5lfxBlWF6zjswU8Vkd/PQThdLBkIpim9CpG1Gp0SWIJnh3j
         nwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598717; x=1793203517;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OO/jQ74sz4moznSOIcQuGfT4C5O0ZbLQA+114JVzDVM=;
        b=Xr5e7Ph5gwszWJIHZqb0Jzj/s9E2jIwPwUom/dtG6zOJeetmHbFIkHSQZ7Z43QU802
         nt4MO12d70eoDGPmSz5n+xrCSOQpX/YNQlR48F+3O6s/VIZhD2f6sh19P+eIw3rHChHj
         wpYtlHqxZexU2fDnHcJfok4t69iFNMYArNyqa7F+bpvnOo5qvuUFiI9l8BA+dyYCI0/d
         sx0U3D7c4kchOxALnnZYaOZMZ3RswwlnM1e/gPXwClSyjxC8eCRIagfWGqtQ7Vv5vcE3
         o1BdY02GOm5fWDt3weO9MMFC+fPkZlfBwhxB8wAR6dKxggdR6vvJU9uNuDjZWOopsGsz
         8Wlw==
X-Forwarded-Encrypted: i=1; AKwUvByGh+w/nKTOsGKOYNNor9G+WE+u2W6u8XuzwHjJIKJKzwki5TYovoFKfORFO7CtBq/s1QKnPcUCwbpa@vger.kernel.org
X-Gm-Message-State: AFq9FYJNBS/chy8UZvkXK4v4ariE2IhjhDr9Ur2iO8CQpROnIlckhbu2
	4p8O/i7rVnDM7feqt/g+6ei4QEfYtzyLY/A2N5yI6rGHNCcvsLK6mHdy
X-Gm-Gg: AYBFou0Pm2fBeOpkW2K6QO65dHJmBXwJ5AEDCSK4ydLgL3zgC0smv9cyLrHWbLzJWZ2
	RSjUie/KQ3p6B0B0eXH0ALMWUHf9ksR2llSgefBCg0v9KfsloLjCkexm9GzotHv7cQEezozTTMD
	AwOt1wcQ6FXtn/cbAqKYmjobfsXIxP9D7boSFrUY7ZpN8MbzMNUMZmtnIititsSFLDnAnG2f4Wb
	J3+KNHRPCagebj7Wj9Cs0AVd1GMKAdVM4IFKMBDgUc7FEq/1011dK0mtFzHFilr8LMaWX/+vAmM
	BcfI5+u/aCuCgzsX0iFreQ5IwOIHpZEb1yhHrS0FMqMyWDl0bU4CW/ZY57MBHJOi/1Uwcasj10S
	wEJSXepy9zICmx5NGEiGZgjTjIFcDUiWaGdwX9fOZvzd72wGLGzqBxNZ5oZyH+tQ49XOTNtv4FP
	oXi1f9QdTyEVphN5U82btyqkonJTtxlNKJscMoV5vypjA0h1pmmn5C5o1DUxhTLPX5Dpbhm47Tc
	Us9EJmyd91qSSXLEYkJEMIGDyvs2KJfyKLgvGF29Xjdw52nDApoc6YJWBUk0CCRnB5ms0THyNV5
	nnZ5+fyYXnSqvoRnmuLy484ArbS0SGM48k0tRDPLINfVDaoPGy37U2A=
X-Received: by 2002:a17:907:d08f:b0:c16:4df6:176b with SMTP id a640c23a62f3a-c4679623434mr231451966b.20.1792598716864;
        Wed, 21 Oct 2026 09:05:16 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c98sm6093433f8f.28.2026.10.21.09.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:05:16 -0700 (PDT)
Date: Wed, 21 Oct 2026 18:05:14 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	"Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, Frank Li <Frank.li@oss.nxp.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Leonardo Costa <leonardo.costa@toradex.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3 1/8] of: base: Fix stack overflow in
 of_parse_phandle_with_args_map()
Message-ID: <o4uzbsrfnpm4isk7kh7f6tsccd5qghur7vkjkyumgwrylvu2xl@dbeuv5cuxvxj>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
 <20261020-fw-devlink-nexus-ready-v3-1-fd6f1c17e16d@toradex.com>
 <20261020155841.59037c99@bootlin.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261020155841.59037c99@bootlin.com>

On Tue, Oct 20, 2026 at 03:58:41PM +0200, Herve Codina wrote:
> Hi Ernest,
> 
> On Tue, 20 Oct 2026 15:00:12 +0200
> Ernest Van Hoecke <ernestvanhoecke@gmail.com> wrote:
> 
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > 
> > of_parse_phandle_with_args_map() reads the #<stem>-cells property of the
> > provider referenced by the consumer into list_size. It then copies that
> > many cells of the consumer's specifier from out_args->args[] into the
> > on-stack initial_match_array[]. Both arrays hold MAX_PHANDLE_ARGS cells,
> > but list_size is never checked against that limit. A malformed
> > Devicetree with a larger cell count therefore makes the copy read past
> > out_args->args[] and write past initial_match_array[].
> > 
> > The cell count of each provider selected by a <stem>-map entry is
> > already rejected when it exceeds MAX_PHANDLE_ARGS. Apply the same limit
> > to the provider referenced by the consumer.
> > 
> > A plain reference to such a provider, without a map, now also fails.
> > Previously it succeeded with the specifier truncated to MAX_PHANDLE_ARGS
> > cells by __of_parse_phandle_with_args().
> > 
> > Fixes: bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through a nexus node")
> > Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> > Link: https://lore.kernel.org/all/aq1CSswlo57jZpMH@monoceros/
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> > v3: New patch (Uwe)
> > ---
> >  drivers/of/base.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index f63a9486b130..5abadab22392 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -1587,6 +1587,11 @@ int of_parse_phandle_with_args_map(const struct device_node *np,
> >  	if (ret < 0)
> >  		goto put;
> >  
> > +	if (list_size > MAX_PHANDLE_ARGS) {
> > +		ret = -EINVAL;
> > +		goto put;
> > +	}
> > +
> 
> I would be stricter here and avoid the usage of MAX_PHANDLE_ARGS.
> 
> First I would check the arrays size to be sure that they are consistent and
> then check list_size against the array size.
> 
> --- 8< ---
> 	BUILD_BUG_ON(ARRAY_SIZE(initial_match_array) != ARRAY_SIZE(out_args->args))
> 	if (list_size > ARRAY_SIZE(initial_match_array)) {
> 		ret = -EINVAL;
> 		goto put;
> 	}
> --- 8< ---
> 
> IMHO, this is more robust against modification of the 'args' field
> definition in struct of_phandle_args or modification of the MAX_PHANDLE_ARGS
> value which could lead to some inconsistencies.
> 
> Best regards,
> Hervé

Hi Hervé,

That seems reasonable and like a nice way to do it, thanks for the
suggestion. I'll incorporate this into the next version.

Kind regards,
Ernest

