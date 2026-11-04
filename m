Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816092;
	b=3ZcbEtEGqR6gNGrT5msSbGadehCsTCZ0MwpyDRtjYktW6JVii0MBo+cwlNC9cFVIX7ar
	 +LkwNEddeZRvE54mU90sj3QkimViPdkH+FchmLJi7odHLbvpPBSP+lLHBqj+5v/FggcTq
	 5P5SZz25+d5jZmiXCt1Th6IJtIcI2Bc/S9ZE6ZrI/q4Y2pLC7DIyFmS9x6XB2Oed9669w
	 qvlMzbHxIY7OXv1/RiaRaXIUP2VXpetGWE5Q3moeLbwhmq34go+WvX84P2ciDmuEwzGVk
	 Agc/sWUNPmsBR3xj9JLFKcOrw9r67xBWsz+91XOyIsw8f3dijFoDiQqKkR+3TtPzJig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=DfeGOvmUfDpzP4mFizKgHmdxnSnCScH5+Avbi/H3FJ0=;
	b=nfxxzjWolBKN6WIpWDpcMtFsesIgANSFvICkyEoWZVU6Rwp/h2rrkl4ZHrszi9fTsQs1
	 iwtPwmV/m5FgWd8vYThHsTxWnbqkTYBWcsgET5rwv+zI5lughpJufVsXxPmq1/AIWmCA7
	 GGkoJA8CiJI6OOQgp4q2Vkip1JXQA1X4tWTimDqVBHP71nQcXMryAWGbFh+PDPxClb1wV
	 WjmbFsKDrLOEC7YheFUpt5zM4ByZKHvJWfCRR4A4pAixZWTNsDO2nQ04GwNeZlRiHLpPf
	 eka5Sri+AHd9hwycStpNqbbitEEwUs4t50bdV8SDNmq/k4k+VG7rHWy17q47z39XmJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bbE59zz3;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9A2606A328
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 18:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D9A2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bbE59zz3
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a18fc7a38so101044eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 10:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816092; x=1794420892; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfeGOvmUfDpzP4mFizKgHmdxnSnCScH5+Avbi/H3FJ0=;
        b=bbE59zz39uwOkY0/iXOQ0Jr1I+oSgVCnw1LdD3pRukxMtscF+4ARLgd8nkwVx5VgwJ
         b+CV8mEZ1JJi/rx/7lueEkwL1ebcPSaHF2OvlR2qTGlNOWnesDSYJUnRck8R1kU98Qc2
         o8nr6tY6D+sicml+LQqVNBiY0r1dCLCzfBXpkjxwVVRjt4RcBlPFOZHtirCvw4G8HOwW
         z7PI0Drkzk5BdF/XwfywBZjzbUV6ojvwwfFBKGP2JpIWwwMpNFYPFBmIK8KRImpiu7Vm
         3v2rsqB3uSgu6/ePCjgIBVnyybXG0V1ijAuy5uOL6bv8cC8bIkSdutpkJYRuuqHYkahN
         1CZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816092; x=1794420892;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DfeGOvmUfDpzP4mFizKgHmdxnSnCScH5+Avbi/H3FJ0=;
        b=qG+ALBeJquToV27zckPgJrXhdszQmoj3JfK9g6ChpYahUg0egitDIrw+8EMfUxgHD0
         alZ0K0YmkDdMayJYgeTCknjwQ1LEk2LuBa0tkI4EHg6Rd85/U2qaUnoln+EGjropMP43
         +SwJ7+ogtZirM+GL65B0r7LdfCiOCmdyzNZg1pyG48B24HlOXmKxKyKbJ2YQnulWtuA3
         lGg+smj5OpgJAWqArqZra0krY/n0vHjUccdm02KQgzQyidW/S9ly+LJ7eNtktPtAoxAa
         iJEXbbIYj53RCBVIecwTKZ8y7frkmJFZWhYPUbl2njK+OQV9bT5zlfWH/Y9DyYhRRWQJ
         Wh/A==
X-Forwarded-Encrypted: i=1; AKwUvBxgW2Aa/4uJx5BmY13zzoas7we2ac0/WyGiFrYc14NuMmdIk+cxMFu+zfbmvjbbP9pnutWMzE4v1VSr@vger.kernel.org
X-Gm-Message-State: APuU4Z9wg3wKAa+FtCpL+Splqx2IcGepThz1bdbPSRP4dCphlMr4JMgH
	7suhif1Zqgnj7+km732+7rixt5zKJKl9NCK+bECvr3UwfEgvqVqZVdax
X-Gm-Gg: AYBFou3DnVrfsyWRHBW4kxlqf/Rxxh6+tYYUjCqhiBkJNc2+AioBMUCeYE+/VxAKke7
	ANzjMKCXjqcl9h8ywTUX9YQC8nT20KKwUZTWLBD2TS3Yb1OKV7FgS1lo4scc6O2gUatxFgiPX41
	IE+QbZmOc20gfzhGSkVY5paIF5uavIq6W1jTcoJ5m/R4kzehR5cF4zM6qXC9iGdh04pzR4J8v8B
	Yhm4ZSK7YdXWtr3kfi6dOpFPLRpqoM9r6PaZhxqCuNBPI4u/IpLxdYvj82WFzhz88oU6Ja68WMb
	2C2hh/ghQneWrdnwS7q1mLidISAYnipW9jYoKKzY3IPBoFkCba0P5KEho1tewwMRzRfLPpxyjiT
	tIzwbOIVDQT3lmNxS9RhdSjskuGrPduif23KoanDuMeQEqUjSXzVZd2FyDbqHKGQIOzOcbJ8bX3
	2Ds7fVMhaA3k0T18vBGmMDG7PGYqOXtyvZzJPozuLHf2JSQrlOwoI56O34VGle8FzLIetkJX2ak
	cTjv/rSGHJwKhixuJe6CHiYrlicR3fRxCiNIFfEaDIHsq1O8k20osyPA/X0RGMmxS+nWMQ8sr7D
	Vwz7F1mkTTrBWb/ossXyRacVqHGK5tNZXfIwcS2izHofsnNHLPtuovU8ih145ra704UVRGh63NH
	6/yZfLzx8DWIr/cJP
X-Received: by 2002:a05:693c:6092:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-36a423e52c8mr29585321eec.23.1793816091527;
        Wed, 04 Nov 2026 10:14:51 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:920a:44a8:6f02:232e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm9024708eec.8.2026.11.04.10.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:14:50 -0800 (PST)
Date: Wed, 04 Nov 2026 10:14:49 -0800
Message-ID: <4e7b28ae9ad5de3708c549d62a4bae68@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] gpiolib: avoid krealloc() in gpiod_get_array()
In-Reply-To: <ausjJSZkaGKNfykE@ashevche-desk.local>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com> <20261103-b4-gpiolib-free-v2-6-ea46767c9cf8@gmail.com> <ausjJSZkaGKNfykE@ashevche-desk.local>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Andy,

On Wed, Nov 04, 2026 at 02:20:53PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 03, 2026 at 07:40:34PM -0800, Dmitry Torokhov wrote:
> > +	array_info->desc = descs->desc;
> > +	array_info->size = count;
> > +	array_info->gdev = gdev;
>
> > +	bitmap_set(array_info->get_mask, 0, count);
> > +	bitmap_set(array_info->set_mask, 0, count);
>
> You don't need these, as memory is nullified.
> Also note that we have bitmap_clear() IIRC.

bitmap_set() sets bits 0 .. count - 1 to 1, not 0. Both get_mask and
set_mask start with all count bits set (assuming all pins in the array
are eligible for the fast path), and then gpio_descs_check_fastpath()
clears individual bits for pins that do not qualify.

> >  		dev_dbg(dev,
> >  			"GPIO array info: chip=%s, size=%d, get_mask=%lx, set_mask=%lx, invert_mask=%lx\n",
> > -			array_info->gdev->label, array_info->size,
> > -			*array_info->get_mask, *array_info->set_mask,
> > -			*array_info->invert_mask);
> > +			descs->info->gdev->label, descs->info->size,
> > +			*descs->info->get_mask, *descs->info->set_mask,
> > +			*descs->info->invert_mask);
>
> Why not using %*pb for masks?

Switching the debug format string from %lx to %*pb is orthogonal to this
change, so it is better done as a separate patch.

Thanks.

-- 
Dmitry
