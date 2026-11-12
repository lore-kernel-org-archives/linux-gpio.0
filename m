Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485788;
	b=BXqf1YWI8eyjQHO6Wn3cgh1SJK3kN8xt+uayTsSDxZjzIn0+VkuhB1y/puNJEx1pK8Br
	 rI5NhIAHNnecrfSMgoQ+uuozXHEG05I5fBPGnqHIqNnDqr3mFVlZjm+llqSFbCUQJ/koJ
	 WwIX+Q6VIAw3WQNUMZSQH4KagjbDsZ/I0i+HhJdpUK1fnLsnOxdLJr6AjFev+IHgZw3DI
	 pbDZ6oryRnEY1Q908XmyjFKyzSR7HDS1/LeIoJqISQ2uMw/20mYS2tklxq0z2DyfrqYp2
	 y7Job1Jof6OlM6UmqIH0poFWjPBsDaPS71JqCMzZ4Lb7mUOLdRz+cEC0KTFwBXdRiKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=q1l9kCQFpxB8dabUGd45sO6QQcnMpjxeKqAqJFRtMGo=;
	b=2WfAIY8bqP/74XS59zpaa4yJ7kcLSwB/GaCq1XfT1KlrMW7ZvHAg4KddMp0Q0Mca77yY
	 QQpHrqe4/wcC/PdPCm99qxxyDj7jlqfYlHcVO17rXChIfSs3vEItRNNDfLghHJofuG8A1
	 svzrFKRqpiLlLMkxK6Yx6XFGhoy81oPZQMg28ungIigbz4GeY5slX33zwbUNyQTkR5kn8
	 o8/LqCmWvU5gKBNOgKfkFIQZ0De/AXLzp4d15u+cSksz9QxcOfypaAcwSuc7PY4/ChJrw
	 skHfP2Ulk7IkUl+R2/CCa/FM36zE7K9rHgcVDPAMbsURomr52fud6cfqMbjK5wQXm1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dkamjsEH;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2995F606A321
	for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 12:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2995F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dkamjsEH
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so49547735e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 04:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794485786; x=1795090586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q1l9kCQFpxB8dabUGd45sO6QQcnMpjxeKqAqJFRtMGo=;
        b=dkamjsEHnqTTm6zxLCGGvG4deMHTQmxQCtrCBf9PPyGrFgo9qqByuBksWKD07W7fHr
         wzp8xNUgoFSEqd1EJVbs10N8xgM9XNax/C+w6Ktu85eOAcokzFKJCZGmnbsIETFrJV15
         pnvuzQ/EkOAUvNtdPn5mXnG82eZ8FRsNs6GdeGnB+8WBcbNJjMiRpq3tL8xvq6+cjnkC
         urcMm04MvwQV+JZnxAyCbtz60yZG8vE5o7gTz4uu0F70V3O+W8Eqc5jEYPwAPKrYKd2Q
         Ii9hSrZ3oikGd+qDsmdioUPFjHOoM/9bbDgh7miAvN/oHdmpLLOvhZXVSDXIz90ffenz
         rtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485786; x=1795090586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1l9kCQFpxB8dabUGd45sO6QQcnMpjxeKqAqJFRtMGo=;
        b=jb6muDrp6EkwMVaqy8WrzD+1IgbrQXoDSQ3GnPn0bGFb+EP39+lj/HrthZziFszY/P
         doj8tCfsBA5PJyrqyfamiM//GaXhVQmIoMoj2+T3nj6Tj+fd6RTmYyMyUxlVJLFfYjKW
         fRwtW4fB2YxVD1kIqT2RoRn2YgZDDvFKG1W3Nm0DA84m7KNBOpgYHMdM1tTsnnGmtucH
         lBoMVfxFES1vuZoSU3vcDRdQq306MgjkLSF4kbLz90+6Ae/YPRTthXkVGmPvnBHBdL+5
         TaMTw8yshaFNFZwz9pBXl7juTlyNGYy3C0BVOKTj632dKREO9iX4Rpv0HZPiTK0YmC0n
         8wzw==
X-Forwarded-Encrypted: i=1; AL+hErG6CFX4JS9GdyRP4FO+NiUZ+KHz8nKieTdCIs/rrhvKqqmVOX1zUZxGyHHMvfyY7doDE8xXKTG+NzvS@vger.kernel.org
X-Gm-Message-State: APuU4Z81ZaIbg3vzoMI4F0G4twkgNeRthe56jg/t6GeY4/ZRoKoufZ4k
	GH1zBV6bJiFiD/Wxp1Si7EOnZXR9LtpnUetvB/mMGpkmjdbHnnGy2zZh4EOy+utm5NQ=
X-Gm-Gg: AYBFou3Difk375EpINjWUjOXFDCyjt3n7lI/BMenuR1HGSH3JWCSCEBAXUYyj2ULhJn
	R17Ho4VnQe8yos1F/QhFs+Fa/v4+cWfnHDKezlo5wRa5dvzd93nAPUZkaR1G5hrsboRbhoXhDrX
	yI6i/qTM4DxWdP5VxqSIWRcAbFdEsmE7FBYIpl31CIxi87qWWXJPSNo8e0EHYySPtuaq9M25orX
	OC119enPe9pj2ooF82opEJl8UIp1JbETrwmOEJhqj2XWMmRhWisQJrYeDRe1sggYl288+wEkFWt
	awtgbKgwn5nC27puBpcm59TzPrQVEQ9Ma+UtawwR9vhITDqwxx2V3KZB+WtxZJ1o4bi7nXkQmqm
	aSt3giHrFpBn/eiDKHUHEbxTXtYBZvSaChiRVO4p/O36dJp/qSdq7kSjBRiKuyjKQFE+F3GLZU3
	HLGeZysxsdUB02Te789RrA1vjsi5Nb8gZRNpK12zG9hz5U64vKyw+XXnDawiuewAReHQvpQnECa
	yXFcd5DYHPt3f9dZQ8sl+yUT9+4eVi7ijDg1W+WJRPgodA2BnrLiwSQTrmw+cFnO1GvIK9sYKSS
	Oy2gIoF74mdGWBn/VEY+JDXssqMO
X-Received: by 2002:a05:600c:4504:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4ba09375b67mr98996565e9.14.1794485786500;
        Thu, 12 Nov 2026 04:16:26 -0800 (PST)
Received: from localhost ([195.94.151.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e29daa5sm70743175e9.12.2026.11.12.04.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:16:25 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 12 Nov 2026 13:20:23 +0100
To: Wang Xiaolei <wangxiaolei01@kaihong.com>
Cc: linusw@kernel.org, florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com, iivanov@suse.de, andrea.porta@suse.com,
	phil@raspberrypi.com, linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>
Subject: Re: [PATCH 3/3] pinctrl: bcm: Use pinconf_generic_dt_free_map in
 brcmstb
Message-ID: <avWvB1MV3BMAnJaO@apocalypse>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
 <20261106070628.1428691-4-wangxiaolei01@kaihong.com>
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
In-Reply-To: <20261106070628.1428691-4-wangxiaolei01@kaihong.com>

Hi Wang,

On 07:06 Fri 06 Nov     , Wang Xiaolei wrote:
> Replace the hand-written dt_free_map callback with the generic
> pinconf_generic_dt_free_map() helper, which wraps
> pinctrl_utils_free_map(). This drops the duplicated free loop and
> pairs the callback with the pinconf_generic_dt_node_to_map_all()
> already used for dt_node_to_map.
> 
> The driver already selects GENERIC_PINCONF, so no Kconfig change is
> needed.
> 
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>

Please CC:stable.

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Many thanks,
Andrea

> ---
>  drivers/pinctrl/bcm/pinctrl-brcmstb.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb.c b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> index 2b942ca7196b..e81c5b295a05 100644
> --- a/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> +++ b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> @@ -180,26 +180,13 @@ static void brcmstb_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
>  	seq_printf(s, "function %s", fname);
>  }
>  
> -static void brcmstb_pctl_dt_free_map(struct pinctrl_dev *pctldev,
> -				     struct pinctrl_map *maps,
> -				     unsigned int num_maps)
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
>  static const struct pinctrl_ops brcmstb_pctl_ops = {
>  	.get_groups_count = brcmstb_pctl_get_groups_count,
>  	.get_group_name = brcmstb_pctl_get_group_name,
>  	.get_group_pins = brcmstb_pctl_get_group_pins,
>  	.pin_dbg_show = brcmstb_pctl_pin_dbg_show,
>  	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
> -	.dt_free_map = brcmstb_pctl_dt_free_map,
> +	.dt_free_map = pinconf_generic_dt_free_map,
>  };
>  
>  static int brcmstb_pmx_free(struct pinctrl_dev *pctldev, unsigned int offset)
> -- 
> 2.34.1
> 
