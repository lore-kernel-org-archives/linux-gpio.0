Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016495;
	b=TLo1OinYPEGDSWZrokJ+QEA33JJfcxwMqYituAT9B4cERiaPP+49shwRS18oB/q1kyIV
	 6qPmCeqiSxmdIAi5CXmD+q+pxjZxS3fIyI7ZF5TQnO+TkkVlYHo/hV8scCZNJmBLWJZbT
	 7kOxl9W5r0D+o7Z81qi3s2/512aThDxkwukaY1RSLPvhhdgoHB/cHO0vNqSN+ua53DIg9
	 KmLoBQDwJIAaBh97O2C4yALCqoWC6RzyOgtg8yHYkcuJPxDl2Otf57ShsaZl7bDy0s0Wp
	 Go6mQDbnVLOCAt12N1BVuZIICmSGa4G/M30veTrJbitGywe5D9CRKPbybsGeWVcFbww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cD/07tCbP0c2PveFePONvl73YWhDWOPfUwb001eQKwE=;
	b=cMLoxQDZolUDFdg2fJz4HX2mAswnEv1rZnZoKzyAxi6DnHra48ciTFf+sumgzZboGvzW
	 ttFqvKcKTMYkQhJjejroDXoOtQ9ir3BfVaGT0UKeN6eLcU+izmQdLeuLajQcdTBBAFHNV
	 JA5743tOpnHWRVt/Ny65IdVB0kUbhUf6jOazZffIL+4e02q053ErYAGj1EgrHzXYu6qu2
	 Dple4BfCt//Fl8BFO08gtHuwXul9GnoVAjXWa+xlxt0z446K1qp1IyCL4YqVapV7ttW4l
	 lrsyCjUK8CcEmPOdKumLBHbuM7eU9XSVP0PdVwUkUFFI3QSjA7oBPBGloD0Prq+bRdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xh4RhHqr;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ED5606A332
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 15:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79ED5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xh4RhHqr
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1644695a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 07:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795016494; x=1795621294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cD/07tCbP0c2PveFePONvl73YWhDWOPfUwb001eQKwE=;
        b=Xh4RhHqrHc3yc56+v81B6EtxtJ0ODDySLnhAH6Bcyo+2KI4tb4m0sow/x8cyaDqfJO
         8Q+GA32xhbsvG9hVZ54LsAdBS8FFPPokzwLwGrQKCbwVfwV2vmeKVJ3C/5b8PX71niNC
         WgAHlQxGht204JVx93ADZwzNuyhN1HX2gaOxQjuZBijmqfBBjB/y8GerqI7D9v4uBTHt
         TWnxI7Rvl1PkKhiKF+n1daFsNkmMPYiqIX0/orF6Lxw7IgqtJnpp0OYKfEgvJJCyBWmE
         e9VhAkiD5Uw+s2MVjs4DGBkwBAJh4QgIIu65X56e50h5v1v8WE/rzC95z0A1Ph6CFlrv
         nhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016494; x=1795621294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cD/07tCbP0c2PveFePONvl73YWhDWOPfUwb001eQKwE=;
        b=wtaMtaA78iXLXzz9jFgRFcuA77kzD9hYsqyhya7CvFIPSBgNmR3FfbzQNoPVsblSMU
         kac7gfZXbpuu6U+Bd5yUeNsrHizJllImjvkAZKpT3UVvoOmfOyyRJipN4pJ+n8Hg/+d1
         fALDwrglHNMZDJObNYudogN+M+cK1wl0En9Dg4aNTXoYz9YJKuBcP7ZMukP0hELaH98R
         PgN4332EEeOrB5zWLcyiCYHGpO8gJHjJvYiYEXw/txLsqOlTqtqyHGViXhSFgq3v92fC
         CyW3R0qf8lMovtOrl+hoQ7nII8q9EeKI3eZW9qbAlPOQtsAp2qGiqK5L+o2VgmI6yS0z
         8SMQ==
X-Forwarded-Encrypted: i=1; AL+hErG/1vD8VXwU9fQ3y1fMkkKjhD+4LS3GztHkZa0mTwLOLhQRpNJjJPNgR48tfAcx4ptW4o+QFtVjNVbA@vger.kernel.org
X-Gm-Message-State: APuU4Z8XWstKEznNlDcapUL5U8KDujE6mGcSRMRrq6O0Rv6cF/RrwPwN
	D+HoScBiOWKetNW24SDVEZPXpwt47BjDhK14aUHQJtTAXtMJ5TLhpRN6
X-Gm-Gg: AYBFou0P/o7VMYMs+PauQVRAvIpY+UkTc45su9ukFWmyM9hI508OnnUWYFJxZg6QMfU
	t5pKEOhorJqnbk1AmFXzcZ9e5gqukq69D32FER+5GIRM99j2ubdUFdGz/3Ofguv5mfl4QXYyk53
	A6YkNZzkgJ6UZGA2CDKcGo1ArljZTmC+sFidgwq74d0QuAQEXpFQhIhYdLd98/RjCmcl0NCx7gp
	fKBC32gqDMkOqhq5hGy2NrkL+cGWe3F7xAUBntLZwpbySGzqrxmIvjsLZSxatQi73mABHgUJBCL
	xFe8qIZ0MxhjohM4I7VC7844AEy75L9/0Pw/3YuXmN/DME0E2Fgltl9m2GP+UXYasmLdhOa8DwI
	w+r80yEnAJn2xQCJveb5goi+LtN/BIWOeIdAppbzNcCRMmb8mMVshdoeyybLwJ13v6LHJCzYRSy
	MVWEM57ZJv7iP3azImgV//2vr/sA5FvivF7f4uPZqwJl1l517ihG5o98VvBGWkjm02KKumDeGKR
	7OkvOGWnXbNhLj8FQZfo6eED5RWGCR2ma2kZGevu7aDtwlRXeu/FbgQTds0wZ1UwnD4hapMrtPI
	7/XSryVehduBv3Y3jGdKIh2GQaVJVurR4i0uvby/fEE5PgQtJg==
X-Received: by 2002:aa7:d0d1:0:b0:6b5:8cd9:fc1b with SMTP id 4fb4d7f45d1cf-6b887f0e5fcmr1777268a12.23.1795016493632;
        Wed, 18 Nov 2026 07:41:33 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a0021d0sm1192372a12.22.2026.11.18.07.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:41:31 -0800 (PST)
Date: Wed, 18 Nov 2026 23:41:21 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v6 5/8] gpiolib: cdev: don't leak the IRQ name when the
 chip is removed
Message-ID: <20261118154121.GC46152@rigel>
References: <20261116-gpiolib-chip-removal-v6-0-aambrozewicz@nvidia.com>
 <20261116-gpiolib-chip-removal-v6-5-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261116-gpiolib-chip-removal-v6-5-aambrozewicz@nvidia.com>

On Mon, Nov 16, 2026 at 03:47:08PM +0200, Adrian Ambrozewicz wrote:
> The character device requests line IRQs with a copy of the consumer
> label as the name, and frees the name that free_irq() returns. When
> gpiochip_remove() frees the IRQ first, it drops that name and the copy
> leaks:
> 
>   unreferenced object (size 8):
>     comm "gpio-hold"
>     backtrace (crc dc8eac94):
>       kstrdup
>       kstrdup_and_replace
>       edge_detector_setup
>       linereq_create
>       gpio_ioctl
> 
> Keep the name with the line or v1 line event, and free it there,
> whoever freed the IRQ.
> 
> Reproduced with gpio-sim: remove the chip under an open request with
> edge detection and a consumer label. kmemleak reports up to 23 such
> objects after 30 cycles; with this change, none after 100.
> 

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
