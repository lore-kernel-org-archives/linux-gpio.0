Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584910;
	b=vv4e4RPb+N2vsaYfIWXmajWdFjop3Tbow0Z/lMQB7wMONnwEYqSb7H67YWuBQrhvnmMV
	 K28L9oAE0Id+o6hslbqti0NXn6JFxz/foauuTBqTSwFrVfdVV6CVbvwd5Da1Zj6RTvUDS
	 Qz3kNVeUKA+siyq2KbuSx2erpcHAHEqERMwBy2/uLnhqt434O0n0W0WunpdsgK715wxXD
	 UHI/EANfCzcLB0KKAWH1jq6vOVEoxunFkxvHTVZwfzp3jN+LPTgqspo6Lf3NCiWdTLgP9
	 exflvGXHLkz8wX7+92wcrfDkoUuoGRrWyZhEr+U7OgzFOxxR+gsJdrkXvcwKQcBYqKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4JQ8+H0JmbBf+PQButIDd4R/MJa+hAkJuZe6gYLdONM=;
	b=xPtbmhkhBqYlk+Gvg8eE6eWXhaGyBMsKVo3Jg9H0oY1WMJhbYx7shg9liXoXsQkZuB1y
	 +bC3Bssj8tRDEYM6xxsSIaIZEC6TC/ud1WxxrKorX7id/k2QZmMuB6ATIKlABEoRKc2Hs
	 Iqtbsy6oGp2IDHLYlt87fignsav40ZK+cMDPJH42CeYeiEAtL42GPAqkGAB3sRqMZ4usg
	 tyG9I4O6Zqjj2uSYxXuXDTpFli4MFmmHZx4r+3j6gcCMRsvriLUzp0Y+JtomIHfw06fdV
	 qldmulzXh5n1X1IQVN+0pDyfdZDcXZozec4RLkn+oLyrN6tdLHGImnoklpjaZRNOXUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxTPZOZ1;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10833606A333
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 15:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10833606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxTPZOZ1
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b244fb7fffso1145504c88.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 07:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584909; x=1795189709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4JQ8+H0JmbBf+PQButIDd4R/MJa+hAkJuZe6gYLdONM=;
        b=HxTPZOZ1wdaQhJWrsAQGtyl1XKuZIm6V7/EM8G/h/K8YvOCiU6viMxkydeV3VpaeII
         kPaJzNl67Ki1bJd2U02hqCO3RZK8HuRkI8goikQ972Ac1umrpqeDa9PDXBtyHoFvaCDa
         EexRARJvUXFIuoGWo3LuQEf+pp/NxyZ3rXGjzn3RQueltc3D3m9hY0ZBFYXUMcKFj6di
         wpwWUcBpvOFEbNx8e09PlrYodBE6RSw5V6trVfQM92nJtAjF/1e56uCejMaUBYwQq0xx
         AtqKpIpzm3imbjqSuVxbsxB/uD0FuWGhj7j7KxumDigQ3yELfKsEtgy2n3US5HJep4ig
         wn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584909; x=1795189709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4JQ8+H0JmbBf+PQButIDd4R/MJa+hAkJuZe6gYLdONM=;
        b=KqISjsIEOTKoV49bKrBnSRDDO5cCfUr6TY7w93u+BI5v6Gr0m0BT3RniQIYrVD+UQP
         VU8ODhmZSn88IWMqHkrBEjJI0F9pynPq45+iERQ2dcq3+P9JJjXHaBj6yy6XqSfh9c24
         PefhmZsrhNkjyEwAaAQZn545NEj74f/RllBYlkzm/Cx+FUJg85MI4Ty/6gJcHx0aXH5/
         uYn38n+i/MfI8g6eqrstGbWEAaB1tgy1HQZAoWsZZZnG1eCaB5J+0xihpTp9Tib7BW1Q
         ZPYuFoP171j63C4Fl48blX030fU5zpnVV7nYC5YMrCMFFxy5mbeD5nxIrKM/pQTzjnKq
         doDw==
X-Forwarded-Encrypted: i=1; AL+hErF36+QWslQX43O1cGS09QKlHMrm7KLwVmix2HGwXoRng617JD6DJ7J/ybsIbchi7O3TmmL/IA/wkRzL@vger.kernel.org
X-Gm-Message-State: APuU4Z9UobRBeXr4Qe3WfbUlHlZqcBfqbSQeUmrrru7ZAP/he4t/3fKx
	vpBcYwfbUbQdWt3KwOrDseryR2kXdspJrzmc1W9JfKy4s4qcAupT2D04J91bOg==
X-Gm-Gg: AYBFou0fdDp6BlQg7en+5DPPv3VT3SgYV/8uFrfb0jGUIoHWcRqqptjhwffyYOsbJKn
	xLAA2aBfAAwE9mNUycQH1E6aVQN2smSsD7vV1hlJsCkIU9YUGGcRxpz6q8HWCj19AHSU0k/C+dZ
	l5F6JlNfW1QBdEv0dE68oxg++ZS/k00SmdYVL96IRAEhxALJv3UPkleiwgvR7+8xZufeLAkZ9TJ
	4rDMsdkuvVPONDphM4zl5yUegz0mhFcVsajBafO5mYkN4TomTpbgOh3VUa9jvrVUkRl48eTglHg
	1YDQGJzVieRE6THoU0XX3vee+sWh4jRLSv0xky9CKoVLY/dzMWpEIJM2dsh2mUU6IFTnB9sJ5OV
	MzRxoNpug1kzdwxT12c99wy2GOePIDIAgW3CB34zEPcg6dJaDUljl3AMNxd0BEQxexrUYwLwt3h
	wOSsioqstCCibP65Pqmy1CxOdvmc/h9aZbbbFVIzNbM4B93VIx7G2FVOvwU5BUEcT3yoiN3rLm8
	07jXHg1OL+t5ooM/oDNsScK632kIMn0hTsbSZWMajwVsx0tv5ivxa3h5dtatQQFng0yjiOhUdzi
	cpXuFSUbtIegeDvwZy0gurM8SZVw1FuMdttylUFDqPaGRBs01MaqDBEtx0DwTUFp4kAU9kk=
X-Received: by 2002:a05:7022:f905:b0:1a6:53cc:7454 with SMTP id a92af1059eb24-1b50311d32amr2553855c88.27.1794584909005;
        Fri, 13 Nov 2026 07:48:29 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b505b5bf76sm5641828c88.10.2026.11.13.07.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:48:28 -0800 (PST)
Date: Fri, 13 Nov 2026 07:48:25 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Eliav Farber <farbere@amazon.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, Sebastian Reichel <sre@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/7] Input: adp5585: use
 devm_blocking_notifier_chain_register()
Message-ID: <avcxRXFG57_mWX_P@google.com>
References: <20261113104218.32566-1-farbere@amazon.com>
 <20261113104218.32566-3-farbere@amazon.com>
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
In-Reply-To: <20261113104218.32566-3-farbere@amazon.com>

On Fri, Nov 13, 2026 at 10:42:04AM +0000, Eliav Farber wrote:
> Replace the blocking_notifier_chain_register() +
> devm_add_action_or_reset() pattern with a single call to
> devm_blocking_notifier_chain_register(), removing the
> adp5585_keys_unreg_notifier() callback.
> 
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Applied, thank you.

-- 
Dmitry
