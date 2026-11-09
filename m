Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212959;
	b=fF913E/eg88uJ+/XK3iEKkla17Yo65H8HzS//96MQCh9qTf2EbWzQm4kiEi2sEFBGcjm
	 hubfA61a3ibmjJferc/De+1xAxcKSCDvZqvoMVYQ0cITFKhUAPs3BLB0VnzQoPmZtrRJ/
	 Boqjp1BfTtMMbCJsWTiJ+dtujRX3EvW6uSEEGjym0Qw6ByQIE+KtGYV4JXEpTYOthr6EY
	 gt4ZeeB/CsOIeMSd9mOG34ycquCM528yEDeazuSlJVvAsxLIUciN6cMowQvI5+kP7fyzn
	 WNDsY+CHV5XCN8lsc9K4MgsDEpAk88kbP6jmG2FCM1jSQLPMqmwZ2GtNRzH+CFWY/9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=s/NTjqdYWnw13s0DFEedbUi3EGrejznp3E57uKJJdoU=;
	b=EH1wVbxLUgovRmkKByweShATAEzRm9QxD9SOqAIs5H5E7tnZVRt1Z85xEhTXqdp94jlS
	 +rjmCC0gHx0QaB6zo1j2zjjauNBkLy7Ic78fxbL77v0guHDMBmTChC6w7AowJetSu0Dvx
	 UTyAxHs50tTxGKs3n3DBiVPW0ng0VKC9LxKVH7gMAr9xo6b9hN0YEzKB/Te+dzhbmLkaB
	 7RtjSMyuZiY1YvOYE/zc1/4tkNlBvegP94RxMwvpei7quSUJT3eaobxm+fVmMzBhUgU8W
	 8KXehzst2LpCGjOztI3NN8MPags/xjhpcilaRKR1uQZnLNIT9U30UsPZTckFQspWAxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A10HiXbS;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406D5606A31C
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 08:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 406D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A10HiXbS
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49412eb1474so333661f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 00:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794212957; x=1794817757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/NTjqdYWnw13s0DFEedbUi3EGrejznp3E57uKJJdoU=;
        b=A10HiXbSnXdcNEg8XH779gF/snNxTYx/dLP+bTh+RMOwoS9bIhKJb+FzUoy4OJZr55
         NfxalrADRbGGQXHbnwn7pJ+Cn3qN2QIZ2Ulmz+OPYGJLhx80D/48cm5WRAzoRdA18agC
         q6Hx12uiSmkKeUFrufWn+YyCTsiPc/qAERLZXG7Cf57nH9FGV3rxE77XqxAi/FcPbviN
         G6FqfD7SbAUAGL/rkiZKpA0gN/0Wo2yojioiE44fRCr0NiztB4d7kJBVMFGlId/W+gvH
         BLGtomKhZWHPPVJFaV8kgY6GGHYMUv1d8mojhRHptTGLW3MsUmshn1xw1R16cQ2y7fql
         XLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794212957; x=1794817757;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/NTjqdYWnw13s0DFEedbUi3EGrejznp3E57uKJJdoU=;
        b=gMfqlJJdosusYw5hK6iKb0zGmAQ7CY1sxRCf39lr5jhHuqC1fW9IoURVb0QPHYTeUt
         trEbgpcZSo/tIxpth4fLSg7mceOxBsMv231H0hpUqlxJEi1AV3Ev2H3BupS9Dqzkc4tA
         QaHWpZuOmX/Uw7s1PBsogFfoSb4KvQN7HQO4iQa64NjmeINQX0uBQ+i/ZYYqaYq/UkRO
         IBEmMCo2GDG6GEC8eHK7wdnDPttpW3pGkCMUKGnCMgMQMZt4hGQa/vBhUbLgA7LaG4UC
         vYvO2cIm1Fk+DSS+W2EEDH/rh4veoOtoNyxZywCTZWHeZrEsgGKNPX0pp+Q23Hc6ycHg
         RjmA==
X-Forwarded-Encrypted: i=1; AL+hErFNAEwbRLjFzjApRmdRNlfnha7xm7vV4IUlxWpRRVnBFRWV/IYCht5mdHwZViz/f8vyAH2VUrJd5fnM@vger.kernel.org
X-Gm-Message-State: APuU4Z+O+6clt5aoaAWBu2cKHrvu6t7l3auPs6t7y4Ti0pbsHz6ZWTvT
	2uKaf0xryYTtfBrn+In5QCEQMOnDOAiWb84yHyXsJrr+vTZ5PBCH2Q99
X-Gm-Gg: AYBFou3XCI4dQ5cMrceoYPzUCSELMfg01x5klsBpu0AmcDJBzf2lKysD0R5WAOtThEx
	FwmH+Matflc+qwigZfjjeucgZLmxIRZ7dfC5NadOJC4W5tk0tKTSMh9gfgaPnRKiuSHT9teMvcw
	q13wS8t/3onqjqBICd8RQ2p/LlmGWmnNnol6CTWumnl6txzktOmDY4sWeyZDeqzmfQoSAmWZUbJ
	9cx7eepzF7/9bnW4w6z+Hxqy96aKUINLF7ZK9AZXHZqt+9X5akbZKaVoHtVKGsGRuh+RAiK20LF
	df0XzBaxHRKruh38ZWp3CapiZn2NOLKm3bYaxbuID+k95EuTbqo5v+YEk2t5Q109d0aCNuOoYUI
	OrT2p85Vf/govekX9SgBQdg+t1CIhe3R/Q0FZHbI1AXoHBhWvp+W8BWIt2TVinlI6ndN/+x70zR
	8z6oSSNgNEnLLaNUeMZYkUNp0N329fFPSJ6vzS/xpqS3ICjtOiEBjxYvxUvhlkhgHM8zN5NAMxg
	pdyRVXVSxx100xfKXHA7RbkqjrwJSo70JryUU/sOJ2nv7fOysapF+0sx3wgRjzy7t7a9yxBKiU+
	f2zrIX3y2B46uKStALTuWOFjTGT/sp3rL2keCd0dCsui5HCIjuICUCfcb0YQLlTwVZORfMAyhuI
	G15UYyWaVhq234ym52pgRnueMZw==
X-Received: by 2002:a05:6000:2dc3:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-495846906b2mr5355106f8f.50.1794212957327;
        Mon, 09 Nov 2026 00:29:17 -0800 (PST)
Received: from ?IPV6:2001:9e8:f10c:8501:a9dc:44b5:c574:7f39? ([2001:9e8:f10c:8501:a9dc:44b5:c574:7f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959755d423sm8459276f8f.40.2026.11.09.00.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:29:16 -0800 (PST)
Message-ID: <c9e116f6-ce3c-4cda-83dc-4e96c7d58aa8@gmail.com>
Date: Mon, 9 Nov 2026 09:29:15 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] gpio: line-mux: fix unsigned truncation of property
 count error
Content-Language: en-US
To: shao.mingyin@zte.com.cn, linusw@kernel.org, brgl@kernel.org,
 linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, geert+renesas@glider.be,
 andrew@codeconstruct.com.au, wbg@kernel.org, opendmb@gmail.com,
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com
References: <20261107161258203oCy-Pa4_0rNe65TqrzFWD@zte.com.cn>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20261107161258203oCy-Pa4_0rNe65TqrzFWD@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shao,

On 07.11.26 09:12, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> device_property_count_u32() returns an int and reports errors with a
> negative errno (e.g. -EINVAL when the "gpio-line-mux-states" property is
> missing).  Storing that into an unsigned int turns -EINVAL into a huge
> value, so the "if (!ngpio)" guard never triggers and struct_size() then
> computes a huge size.  The allocation fails with -ENOMEM, hiding the
> real error; struct_size() saturates on overflow, so this is not an
> undersized allocation on 32-bit builds either.
>
> Use a signed int for the count and reject non-positive values.
>
> Fixes: 2b03d9a40cd1 ("gpio: add gpio-line-mux driver")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/gpio/gpio-line-mux.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-line-mux.c b/drivers/gpio/gpio-line-mux.c
> index b4452d956b..19e4212de2 100644
> --- a/drivers/gpio/gpio-line-mux.c
> +++ b/drivers/gpio/gpio-line-mux.c
> @@ -48,12 +48,12 @@
>  {
>  	struct device *dev = &pdev->dev;
>  	struct gpio_lmux *glm;
> -	unsigned int ngpio;
> +	int ngpio;
>  	size_t size;
>  	int ret;
>  

Nit: Please adjust to keep reverse christmas tree. I think 'int ret' and
'int ngpio' can be merged too.

>  	ngpio = device_property_count_u32(dev, "gpio-line-mux-states");
> -	if (!ngpio)
> +	if (ngpio <= 0)
>  		return -EINVAL;
>  
>  	size = struct_size(glm, gpio_mux_states, ngpio);

Maybe return the error if < 0, instead of -EINVAL for all?

With those addressed, you can add:

Reviewed-by: Jonas Jelonek <jelonek.jonas@gmail.com>

Best,
Jonas
