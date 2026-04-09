Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1AF3A9DB3
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 09:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726851; cv=none; b=E2UTsw+CjmVIJKEQx7CbtGS55WFAn+xaUDkyY8cwWdmdrbW/pUxg7uMMz0FNleeRf+qoa/i4m1JzvHhQqLx0/NxN5f57Eh6frb6RXep43BTSC430Z6Db43uJbHm7uBji0qKlv+6PCr2akVPq8/NE4IUHDvx6Rvj1To30zTE+iL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726851; c=relaxed/simple;
	bh=mm62eN4k+B8PwcvEaxPRD5TXrCmDeIaV9KBROnbn2d4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=onjc1AwmPJBvoW6caUcW/tUlOhhCz+hNgcJ4UMrayonJdNBl1ByxYz7XATjlx2N6XBFg27FjNzyfYx50lMVNtTN9CeIJYXOav9QugK1mCgkgLqbqi3K/GKuRaASF1ovPwAuS4fP4w58dhPQDM+u6cP6BUdCNT9JGCx2uZwRg75c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CA7CXUaP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=T2EloI4F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CA7CXUaP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="T2EloI4F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775726847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RMBBLjrw2ltVt20QSl0hxzy34EXIjg14ZZ40oAl0/6E=;
	b=CA7CXUaPZOmVxYZQFFuib9PkayANa/32DElacpDtzlho4z9lP5xLcKAUU8zpxw7561D/ie
	KpDsrhPY1KGh6rpKHfPHjQO41zDHHeua21OkUccvZ+lNaMoLkd//I9GBTL8ol5qVkFnbZb
	B7zHlEfqCd8WamtTFf2YC/Nv3BMgCjQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-EpFoE2DgP5SRaPcp5ZijWw-1; Thu, 09 Apr 2026 05:27:24 -0400
X-MC-Unique: EpFoE2DgP5SRaPcp5ZijWw-1
X-Mimecast-MFC-AGG-ID: EpFoE2DgP5SRaPcp5ZijWw_1775726843
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d02fa5860so592699f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775726843; x=1776331643; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMBBLjrw2ltVt20QSl0hxzy34EXIjg14ZZ40oAl0/6E=;
        b=T2EloI4FMl3+O1FEowIs1gyyAqJFE4ql3xpiaFhc2ovvS8GIONpibCJLWL+BfMgYRC
         ruqcaGjarsVK18HfZIxn0o2sQBjddsnCvQ2pfpfVkskmn4zV4e2wUhg2wPh0Kziqkmza
         gSkDzLebj9hhd2Ok/u7aRakHEIJmJV+bey9TGFrBshYXdwaOkydsaW6Rydq4NFhLsHC6
         ZwrFWgorfi35azCVpcPAytp9ObPvGH5CpkTi/usoamKTXxrDHVtev+nYGXewCt6w302X
         hNEs+U8oz8Lvj+rKtLcpbrpoiLOLFEX4CUyNr/wm23fYllFD8iilbzAcMA1ogDUEjvCV
         fnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726843; x=1776331643;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMBBLjrw2ltVt20QSl0hxzy34EXIjg14ZZ40oAl0/6E=;
        b=o26FMCwCtH6+NRLpbR+SdYbKzEVGKK9uHdZOwHAh3IQWECKnMov4KKQmD1HbZwBgcr
         4uCVKje58Y9sTD1pUruVCP7/ugI4v8DBk+rhExdj6F0tTu0geC9qa2eXGGE2/fFIsQf+
         G68onC3UsF0hba6z7pZk1MDXHG93Y4YBrKrjjLl6JiEZbhdL9SS+aF7OHEedAVDVjP1+
         mUhVv1IFMEfJ3fFNY2VK5RkkYX1yO6W/yU+8Pnir0w9x2YhWQUbjJK7ymZnNPx2+G1sP
         tngiHnjxrRIGRydyPrSh+6xGdZd/umU/EKWgU5Fkok6/jENzOuOfgnBo/VfaC6mvNwli
         rZVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyqRjzxOZRizgK7drKg9moiYlpnQk35K2DJO272L4jb7qSWCVeYVYkWbCqB2R3X9mnUL8GH9saJWGK@vger.kernel.org
X-Gm-Message-State: AOJu0YwsoIH6cexTjhzjoyjMB1DT5BtxXBjD7cTEIw7R5xJozHIlTLqx
	XunGk/htWcWIw9+pJIWEviPiCp+3938e2kog3Ro0sI2AzCivzAExeYBsqb8zp2lgfG9nOcE3BG3
	RzfAwwl+Aytp4lRcblPer/u6vrpAkNm2O4TO6TjZrqWAhYfkIeWGSQRoKBgMV1Qo=
X-Gm-Gg: AeBDieu0LryPkSo6x6812I3ryIhDPxQqIbojduFhYU3LrQdo6eqk9wIakfS1krZLD0y
	M5kTETjg+91bFH523rAvJbKLksEgfT1ZE9kEsGyE4pU998fuxKr/fl58MAByHDAAJ78Epqtj3vC
	yTxw2CyZqvMnn7WNyZRAQaQgTG3fvq3OxBsn7eY3QDdxa6kM9IJpA2JT//ceKQi5ykD77Wbi6Ap
	ajdc6ceVU7oAseqgVD4xPr+EXlo4jALblrReLbpKDJMOL7n4WKUQ7ns0jxpLEiE+XLrovIBtEF5
	3ABXKJFCGzKmaZrwVi8qJp4wFLX6HENEmQW1i+1vnAUlTKre4LvFb3DjmTVJK2L7LlHh9jVNtPa
	1LIeHfxS/XHhMT/l8z28xV3CUU2sBtihqeKfSqiG08D3ZS/Zc6A==
X-Received: by 2002:a05:600c:c056:b0:485:40fd:8390 with SMTP id 5b1f17b1804b1-488998ef198mr233647975e9.26.1775726843305;
        Thu, 09 Apr 2026 02:27:23 -0700 (PDT)
X-Received: by 2002:a05:600c:c056:b0:485:40fd:8390 with SMTP id 5b1f17b1804b1-488998ef198mr233647625e9.26.1775726842874;
        Thu, 09 Apr 2026 02:27:22 -0700 (PDT)
Received: from localhost ([37.221.85.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd1bb76dsm65282105e9.8.2026.04.09.02.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:27:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Cong Yang
 <yangcong5@huaqin.corp-partner.google.com>, Ondrej Jirman <megi@xff.cz>,
 Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 10/19] drm/panel: himax-hx8394: support Waveshare DSI
 panels
In-Reply-To: <20260401-waveshare-dsi-touch-v1-10-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-10-5e9119b5a014@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 11:27:21 +0200
Message-ID: <87zf3ciiva.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:

> Enable support for Waveshare 5.0" and 5.5" DSI TOUCH-A panels.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

