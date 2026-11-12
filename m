Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485763;
	b=DvLo1yy+096pxUdelpRfRiG0r1WqyBx2xhwZK1cFvwH6I6w1THjJKxP0fYIM94TkROeX
	 w/2YXVwp+CbrvnlL1xT1hVox8Tyoiv4JXinQqRIlNRkPN8FOYE/74RcBdpSWHCsBvk8kA
	 uMUG0WGF70vASV3Hgr4/63ITuQPjkl7n1pW9nvck9oUZBnKc6QMSeAYeMDWuquXpV77oA
	 BlMxsoPvXYvsKbSlDZ8+rp4UA0MNizppvxGLlrpvCyGPRnM9P1pzAHyFUBWUvPLh6PKdS
	 4oV5YgJT+BGKeikQJFzhAbSvQ0k6QZgwLTv2hCxnEGKDGVhnnReT3JEgCjYOMMU41XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Day4XSXUwJwiabk4eYh/9BgBg5zitkrGJ+hEmjA9keI=;
	b=Ts1qrso1/C29dQzMyDcCJPcZzjLAgwEdXpXoHmFRlZNQKstSzKwLUcVDNpVZ+w/zJNsG
	 Jrt1pIs/hi2czfVNycZw/ogIdoSkCpIfL2mT2QVp61PLwPSMQVEBhHaYmuNSBRgkKD2jE
	 XFnA4++n24+bDAPsByDPsrTk4nug8L5/Y1NWYEShExQO+PzJpP8gLUIfaCBOBlGGynVkw
	 oS0T1iOHjroFNW26Gs8skRpxL5bZHglr3Rw/Xhxj3mXHQCVk9DVokY65cRuwG3xYQBjYe
	 OV11rn4Ghnx7p/3WZVoZHLgh4XKBuQ4W7lcDbGXXiQ2/aVgB4wgt2cHJ1FuOsNngSeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="TrIfo/c2";
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C49606A327
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 12:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74C49606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TrIfo/c2
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso5970293a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 04:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794485762; x=1795090562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Day4XSXUwJwiabk4eYh/9BgBg5zitkrGJ+hEmjA9keI=;
        b=TrIfo/c20w4B3bsZKiGOj4vaPS888vkqmTuI8IfJRgT9cLuZGAWB8DiBZiSW1Ryeed
         ZhcDaF0gzmo2bK2Vqag1M9v9EHXay1TY0epCzjHJ3eWYZhyR4iVfJ78UE1tJUfYXoPN0
         awjLjLfW7fREyntaHl7U1TUy66pA9GbZeL+MX7/Ar3DwEVusJXbumVmLvc9dNZH00Sfj
         3isorvrMzs/hlzqujwXfildQMv1e+SJJ/Tv4IVFYbI1A6FFM5jnSL2YpsT2bdMr3DJW7
         8OHSKu4NjfjLxgLNHZJB9CsZ8bsNXc6+Sbd21Y87wK/eZvWbTpn5EtY+r/R8UsQfK490
         lLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485762; x=1795090562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Day4XSXUwJwiabk4eYh/9BgBg5zitkrGJ+hEmjA9keI=;
        b=WPm87FAiYTBNDAT5RVliIuTCIZUksij4v7C0XyXG301witdiF0IeH+Zr8S+etuams+
         AmxyEcCl0GfbqK464TB0KVkCsPE/14Hs+g3B0ZMk1Aq8d9eaj34kxbB9V+lUxBQnLit9
         z3S15QmK9L9FwkbVvuaSvEQetGB+1EO5TIFMjyQ7+cEVns0rqlgLHjBIOqp2g3Iku8Gh
         KWWxeQhnmpTovExlTIpzITxuHlAHBHVeUIYKb+0TF2R7ViIs+/8AsugF+KTOSGlUjpLp
         6u5446yHF3wIQ9/FxC2aHY6MCZZ+0LqffroKRL4WE0+NVyt9PBAuSUj4vluSCwU9t6Sh
         CxXg==
X-Forwarded-Encrypted: i=1; AL+hErE69ySzRne1i270ZK/tplI18BD7Qt/OTOquf/InGmc5oxcykPFLBFg7FvfGcOtpzZUKZ1C2YTSfXmSQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/VjZqXF12n31KljI72ln/yb1bszrvfrVlOFYoBRZbIiyOHTvHs
	v6eAWmkIcN8Udus78l+DUhDVVcLAtcJTQMfNzvDuWriD6eBRbgQ+H/YrnASUCcreqzs=
X-Gm-Gg: AYBFou0c/Tq9T53XlAKBiR1mW85mT1vo/pfvqo7vEZ1FJI0HRP8B5amIMANZygyeyMJ
	9ZuNNyaNX0T6P2Ab4+Ltsp/bLeSSlzkMzxQultwTHyLhMaJNq9AL4q2nDUN6KV/pKbx1sT2vXjx
	AFDLp0bUz/tmwzorBzqOvU3xXBxk7W03phUIHDuTjDGMwUDYIMiIG3w31x76X4kQVQUU2mG1pUn
	3npy20nzD3T9drUmokhMvED6Av/rbW43pcpgF9fPL7Nj2cmiH2VCNHkW/Koouo8s4w1S8oeqL/u
	eXpANNHPcak2yGGW2s72j5Xwb06KH8w797d4OxtDWqiDm3tGWjLkMs4hBubDz0VXh9HXeMHUYRP
	vI1Po5bh8F4KabHyMKP2wxr1emjHgI+xqW43sATQmlWNK7ng8JAIOgP+Stz2hJgjTjBJPStRB7D
	VDLnf0EtrTb6MezWGTD/7kNRoxcpEZv0vd2LAlQJlzve2KZNBPObplawkrqzP9WGENPCUxF6P2E
	f6GonsmGqxFJCk0v7iUtKYWtgk/2Nz8OF+sfBd5NcLumK2nhiKjTakfBGw2os/ACuvikB8lAP2B
	E65ZibjzT5V/w75XX8J8EKU4611dmLYyMwP3xUz0GWkvB+aPlw==
X-Received: by 2002:a05:6402:84c:b0:6b5:867c:879c with SMTP id 4fb4d7f45d1cf-6b77780e6d0mr4095632a12.35.1794485761603;
        Thu, 12 Nov 2026 04:16:01 -0800 (PST)
Received: from localhost ([195.94.151.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2c05dsm16127012f8f.25.2026.11.12.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:16:00 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 12 Nov 2026 13:19:57 +0100
To: Wang Xiaolei <wangxiaolei01@kaihong.com>
Cc: linusw@kernel.org, florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com, iivanov@suse.de, andrea.porta@suse.com,
	phil@raspberrypi.com, linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: bcm: Use pinconf_generic_dt_free_map in
 bcm2835
Message-ID: <avWu7T8_dutAW8ro@apocalypse>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
 <20261106070628.1428691-3-wangxiaolei01@kaihong.com>
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
Content-Disposition: inline
In-Reply-To: <20261106070628.1428691-3-wangxiaolei01@kaihong.com>

Hi Wang,

On 07:06 Fri 06 Nov     , Wang Xiaolei wrote:
> Replace the hand-written dt_free_map callback with the generic
> pinconf_generic_dt_free_map() helper, which wraps
> pinctrl_utils_free_map(). This drops the duplicated free loop and
> handles both CONFIGS_PIN and CONFIGS_GROUP map types.
> 
> The error path in bcm2835_pctl_dt_node_to_map() uses the same helper.
> The driver already selects GENERIC_PINCONF, so no Kconfig change is
> needed.
> 
> Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>

Please CC:stable.

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Many thanks,
Andrea

> ---
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> index 725e880ae086..69a92cd7bfe0 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -760,18 +760,6 @@ static void bcm2835_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
>  		irq, irq_type_names[pc->irq_type[offset]]);
>  }
>  
> -static void bcm2835_pctl_dt_free_map(struct pinctrl_dev *pctldev,
> -		struct pinctrl_map *maps, unsigned num_maps)
> -{
> -	int i;
> -
> -	for (i = 0; i < num_maps; i++)
> -		if (maps[i].type == PIN_MAP_TYPE_CONFIGS_PIN)
> -			kfree(maps[i].data.configs.configs);
> -
> -	kfree(maps);
> -}
> -
>  static int bcm2835_pctl_dt_node_to_map_func(struct bcm2835_pinctrl *pc,
>  		struct device_node *np, u32 pin, u32 fnum,
>  		struct pinctrl_map **maps)
> @@ -916,7 +904,7 @@ static int bcm2835_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	return 0;
>  
>  out:
> -	bcm2835_pctl_dt_free_map(pctldev, maps, num_pins * maps_per_pin);
> +	pinconf_generic_dt_free_map(pctldev, maps, num_pins * maps_per_pin);
>  	return err;
>  }
>  
> @@ -926,7 +914,7 @@ static const struct pinctrl_ops bcm2835_pctl_ops = {
>  	.get_group_pins = bcm2835_pctl_get_group_pins,
>  	.pin_dbg_show = bcm2835_pctl_pin_dbg_show,
>  	.dt_node_to_map = bcm2835_pctl_dt_node_to_map,
> -	.dt_free_map = bcm2835_pctl_dt_free_map,
> +	.dt_free_map = pinconf_generic_dt_free_map,
>  };
>  
>  static int bcm2835_pmx_free(struct pinctrl_dev *pctldev,
> -- 
> 2.34.1
> 
