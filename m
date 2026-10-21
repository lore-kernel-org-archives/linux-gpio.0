Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602948;
	b=E5HbETCXyO3BRl+ryQS94hFHpVRwkQEUUX9PsMsiX50x4Oviql/zVFxS3JKa3GvKKCp9
	 oNDH97zRIdbYRHZvnz1qJnP9DSscj5klmTxmISg2lTTsFOxH3eZ4njyNGAyns7te3ORrz
	 o7vHZMd/GEj9bjfOjYcLflVd0DJr8vrzeyxpXWwRvKyHzEIePnqDGF0OYDdom7m4a5TpY
	 zicFete3s3OzfAkO3rxBTJ1YhCXi7UaUZshPG8DDr/Ay7ryKxXT7Hkr/eUeOQOgObLkgq
	 jPNdavzaxqRGgI0T/hQgmlj4CKpEkV+AQRPIFz9UAetKBiZwKBZWPXrJLfiqJbvIfuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=p9BvQ0VeluCXAWmqoKdFU0SfBt1q6ntM16zBa5vzFtE=;
	b=gAC+pqY540txupxjj11YzpsUXGEnM1RRneJ0p6QHpRkJadnJtKUz2Crc0PHDeNXIJcVA
	 eCGGpwFirQL+vw48tAl81hxDNECb2O7PCIL4VC1huPifIObEM2jyadl5mjbp2Yeoye7tY
	 5JA3irMLxXHmO8EowLLrw3wxE87d2A087ldjJwo46PWzTY+1uiX+2GaqeoSOUPrdvmLbP
	 e2oAxn7VOg3Uixo05vDh6HlJk4A0fWeoVoo7Usr6SUjMIkGPAgHBNGh/QTbGFXR2jg05l
	 mLugBzyZ7O4huJWKQ3wQjOcDU3hI4KX3tZsHc4urWZQbCqAWnAYli3fy6zQ5i1ciqQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ld2Q6zjM;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425B1606A31D
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 17:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 425B1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ld2Q6zjM
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-170135e43c7so902851c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792602947; x=1793207747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p9BvQ0VeluCXAWmqoKdFU0SfBt1q6ntM16zBa5vzFtE=;
        b=Ld2Q6zjM355/jbQmnQs79eZACeQtT9eZSUVIhd5Iysgzp/Nu+p/pKOhTu/WWo+Bi3Y
         YDzHPb2GMQHGcgieRnH8M0yHs3S9ZbhX1D6HK1y241SRPxSYmYl7PNYV1Q/joCXTVlzd
         LJLLmhyTdlossdq5uzo44GcuqvolB85SLhiRRzYkSl8SOXAIoSbQtfPnkaQgh4+yERQX
         CZZxz4E+lpVBHfyGibdgqyKV1xePoLNyaZV2NlQMl3P2WugENL4CG5tyZxDwT9WuCliE
         gcCMOywWQLjW+cwfz4o5eXweG1or6tmqp92Q5Kjf+ZlvBAxvas1gTdNLK6KgCEECqQk0
         NAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602947; x=1793207747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9BvQ0VeluCXAWmqoKdFU0SfBt1q6ntM16zBa5vzFtE=;
        b=d8qTj1ExtxUezhqTYfzDMp+jpCy4XZ22QvowC1YHdfnWpKgn7bPWqHXAr5eRCjHlvS
         iBxBioGqgKu6U+6GNfg7Hjf0CkF7pP5pclMGYRHi8+kwOKOBoAEOJI+E1pbwsdfXN3if
         2+SvNLOESxOhTM6ZbuEIXOZwLo3n0FZ5HxgMOQkmbd4fseMn7FABZgEVjSDIJx4fPj/k
         T0W6NDUyt26GzuNBvaBgSrpRIMqgAkEKD4yn/xJ2tJHGusNZj3rkSxK+s0Mgzx4NIXp9
         sQ0aRFoiQKjsQoDJTaLpyJjIwQ6tmmtUUobI4b0sTcExJTAxNWNkiUp8MYveJXZWgX08
         eAAw==
X-Forwarded-Encrypted: i=1; AKwUvBwWAg90bsWLfYKwz1avTXwLPgydnZtjYlXn8DB2/8yCeB/MQn2GFGUkvpyLfP2ENOSdgclf/cXuJoVF@vger.kernel.org
X-Gm-Message-State: AFq9FYIojm+0e5qqvNCmGlGWFW3BPV5blJUabt3zy/UtoC2XdZDcHwKt
	5Stm9wuhP2DsDCEuSajiwoGDguD4ShgjN+GtvGtXWtAAbMVgXO58v2EX
X-Gm-Gg: AYBFou0BVBEhfplEtyWo+41CckHW/nFknUxojR6NwdOAAwD95EvCFqIWY85XI+1rR5E
	gwUh9J6UnKRyMlE7dxZLA6eOEuTTPwcDzoN2zSdmXzUps8dvlEdiJ+lAw/G6U9+ZvfZ5L99XltJ
	UtcpKADuzBl55YW19aIk2v/GT6oqh28N+zaTF39HTOO2IANtqSBceaJMKvvr02ENZJZOVGmsHCm
	VeuQS+S6JSwDElXzzhN4pEfxv5sVaxxOfO918ryrnCUQf0qU1DwZgpHUhCwe7ju4ecM4s+kzv/7
	iyapa2ztseJutnm3JMUDpWPihoUO0jXK8ym+tSumVmshZqCGuLcsS3R7MkNl9inEk9DONuQeCVD
	y4K9aw595HYK25j9akxZvNCenDSaQC1Sb/qXg+3pwDs9OYJPiGGuPWRComnHnEYhCQ8/3d5Dx0s
	ICWrqVGvt0MbTQChMdHIHZH6a85fNueeVHnpgMuyIUQo9e3pbIBye3pdPYYFtz+tSXhkyyz8w9v
	JmrsNoNox7I3AhW8MjiBovajKB0OGzPqxZzhAsQW1HdwfjbESffs4PzDLN9dQ01eovdl70SHQu8
	zCDWuthqqr+cK/yEHvX8TQ==
X-Received: by 2002:a05:701b:2914:b0:18d:96e8:b913 with SMTP id a92af1059eb24-190a9eaab7amr2994159c88.47.1792602946836;
        Wed, 21 Oct 2026 10:15:46 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035926fe9sm6166666c88.2.2026.10.21.10.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:15:46 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:15:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: soc_button_array - use __free() cleanup
 facilities to free memory
Message-ID: <atjyyqxnlqEvwNxh@google.com>
References: <20261021015004.1537738-1-dmitry.torokhov@gmail.com>
 <20261021015004.1537738-2-dmitry.torokhov@gmail.com>
 <atjw4b-ICVGH3-2a@ashevche-desk.local>
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
In-Reply-To: <atjw4b-ICVGH3-2a@ashevche-desk.local>

On Wed, Oct 21, 2026 at 08:05:37PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 20, 2026 at 06:50:00PM -0700, Dmitry Torokhov wrote:
> > Switch to using __free(kfree) cleanup facilities instead of doing manual
> > cleanup or abusing devm for allocations that are only needed during
> > probing.
> 
> ...
> 
> > +	const union acpi_object *desc __free(kfree) = buf.pointer;
> 
> Rafael added 'acpi_object_free' for __free() (pun wasn't intended :-).

Not sure why it is better... It goes through ACPI_FREE() ->
acpi_os_free() wrappers which might be nice for ACPICA code, but has
limited utility in the rest of the kernel code...

Thanks.

-- 
Dmitry
