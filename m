Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392921;
	b=xz0EDhXUlQsGfeeQpXPHGGOaVtHVJXCf3X7RI/zrD25IQWPZVQeZaYTIA1bIS4kPtYHe
	 QeIkV0ufJhx3gDccgfCnRQ/H/Cz/w/aRR972Sz3/GndEOeGly0datay9YVzD+8JetE77j
	 3tCFJDXPv0g2dnK/YHvhs8wrpSsnH0Vf8W4fxbmOcntdLi6JV6SKQYRjOw+0zHNqFSvyM
	 UW98fU5kxazKEo6kF5+sVpYwFBCIvdpTHE5zUYbanj4kpBxcAI8upMx13XMz6nBZwo+H8
	 yx54yBi3bFRe0FTtw0ssD5P4Bexjs1Y7H+NlqxC+7Faw6hMzpv6/QJePRekVOM5uNtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FgfjZ6gPNStEt/RNYx2qJuKKf940MnozlyJhtYv0suI=;
	b=42Nzb8vG1Th6LTGkGsvWncZgA+hJGdQlJ4Rkt+OHwYzRdz0aUjrU+Drlw6a6M2BjWPYg
	 lJR7DgWij2E0LuqePrxiNhsLDglYnvtA4grlwqkRTOUL1xJ6I2Hkx3p5X+i2lVx7ETQfj
	 UFCVA3oMf2KyfBEzGx55FLXVMqll4rjfLPT12QfwEwcISjTFpXXEIB2tBnVWNfXb7Ldk8
	 gS4TW6GmRSyISdn7Lwd8z5XceDnMTiiV4xDEbbtMHLMt6UUf/pIXJ6hShGVu/Sqc3f7oG
	 J1+CVJmzOEPe3eLBSs9OYt1HeITr+7XVWtdkbiBNm2xDd4TksMaM2MvQS4bQGKhYyLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zWDbBcPl;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B28606A327
	for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 10:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B28606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zWDbBcPl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-498f5fa5103so801205f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 02:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794392918; x=1794997718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FgfjZ6gPNStEt/RNYx2qJuKKf940MnozlyJhtYv0suI=;
        b=zWDbBcPlqS1AC19c/HKVJJivTF+W3QDFDNQtIKOvb3hEChlZ4gd3uHJGRCqzbATgi+
         4WA95HRAW2CM31vuAQddh7JXzptPeou2EnYnKEFZGeKj3eOKR3tQjEXWHFnPKbtomdzT
         qYebL4M08+kzm+fecTEfuUPhgT3cf2mQl38aA0zBrA/RVjVllPMR7+CI+ypkaVRyCVHv
         JyASfAk8iIqtIvzNX4yFl994GJnBbETlTTUETK2oIjy7wEOHZ2MHdtCi1gKcVIEdxh/5
         IXw9112LmYt355Rq2qfFzl+8sFHcxLKC9TnUDf617SM9jDHfoqgOW4LLz/zDpS2v6VsY
         vYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392918; x=1794997718;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FgfjZ6gPNStEt/RNYx2qJuKKf940MnozlyJhtYv0suI=;
        b=cY2jlzMAr8JTtb5vN6+WxA0rnBmS+mwQsWWromwaK+urgHzL3QgKgJoOhyplASJv2y
         CrVP2J57KhljNR46igjCxI7mlc3QUpor52qtNiYFHfbObFIUf8N9ZnEyceneea7L7/t5
         pIOJRLKDOlA3vomH7Rn+RmXiQEN7VWI0ZYgVoexUk1d6x2MaN6IdjNUin/WKYm3xMFAQ
         /Gfhb8WudLvB029+KX7EbbZDbovKHCCseKTCtbzMycp+188LJ3F0NaHPyHT2MZ/M5X0N
         n6Ckx/hzKP8Q/QXRXpgHOaAyzOuA8MSj5G1yP7gIFWdsSaCkS58FKBqsPejEtYWT+SrM
         mf+w==
X-Forwarded-Encrypted: i=1; AL+hErErUNdKchYibhYB+KQYOCU5FWWQYlWi42AbUcpWQWpIItAgRDftH8Q39sMp3ZSlbC8xfdRUlYBsAeFZ@vger.kernel.org
X-Gm-Message-State: APuU4Z8+/BW+o/p22pkYsyy1EKEg7aAyJDbQdnPfHX0vB0cf2S22LGBU
	3RlvN+8EMn63ps5ckF+eqdtmAkHPWoPMVAtgm/gRGewCR35AxB5Hygeb
X-Gm-Gg: AYBFou0VxjZ2S5rpL3/k5Q0q4FnoSdAeWb5gYjNqkKNs6PYnsr7Zf1o0KPCKAKvBLHW
	ZDTb9k5F1eLhd/660uA0B+ivwVe+LNfdTzT1+vK/C7wA7EdvXovrALdgMeIiSOeBdtS91TIMX0i
	O0AF0bK9sxn8p0e+0vw70HMmX6Bk85Em2R37w/OQ1VrOUVsiMO92Un8kBjzEqI+UB2oBAhtez5h
	Sf1xhpOcyqIRjm+Ya52CdNMQMIYQB83c5OT8FLe62jG2s37in/XWYqh3R2J9ozRQsKXgiKsk8e6
	23GIlfauxzTK2EtNIzUpi3bm6PlQfwD+fyKFUOA4z1kiv1VE20mzmF/WQZEzlfqtZEDwyj37hdo
	A3im6AUYZ8+Q45WgdfOOEJRGt5ar2evmgOzEUspiAzzWThr+w4Odtn3dTrlKfJvJeefVi2venk8
	c++2j+1wcU6lWKSMySMFofbzFwx1CY0kbDXEb7HekuvjaBKhAWBkPUGZAjICNqmzBtbfbELgAJp
	RBHYwQHBqe3S04rEV8LlgbagLvcdbnbWAppGCXYntGeemSjmPE6JqaDn0DvweYlMWuioKg9Xsnx
	+LON/V8kVSp7+q21H+DTfwnBEw6raNRxd6P3LodFlAptXKz1UfpjcETJQ2X5rvg3pA==
X-Received: by 2002:a5d:5f47:0:b0:48d:ef7a:e59f with SMTP id ffacd0b85a97d-499c75528cdmr3034821f8f.17.1794392918442;
        Wed, 11 Nov 2026 02:28:38 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498361f674fsm10337668f8f.33.2026.11.11.02.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:28:37 -0800 (PST)
Date: Wed, 11 Nov 2026 10:28:36 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Joe Perches <joe@perches.com>, Alejandro Colomar <alx@kernel.org>,
 linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Andy
 Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel
 Scally <djrscally@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Johan Hovold <johan@kernel.org>, Kees
 Cook <kees@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Linus Walleij
 <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>,
 linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 5/5] string: Make strprefix() const-qualifier-generic
Message-ID: <20261111102836.759ec121@pumpkin>
In-Reply-To: <avOn57pfHntiwcaD@devuan>
References: <cover.1794323750.git.alx@kernel.org>
	<35bf6672f84f07de3f40e8db9e7fcfd643894fec.1794323750.git.alx@kernel.org>
	<64aa89daf23821f95780813fe96882ff61688578.camel@perches.com>
	<avOn57pfHntiwcaD@devuan>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 00:27:28 +0100
Alejandro Colomar <alx+linux-hardening@kernel.org> wrote:

> Hi Joe,
> 
> > Date: 2026-11-10 08:32:41-0800
> > From: Joe Perches <joe@perches.com>
> >
> > On Tue, 2026-11-10 at 16:33 +0100, Alejandro Colomar wrote:
> > 
> > no commit description on proposed patch  
> 
> There isn't much to say, but I'll add something (the explanation of why
> the parentheses are needed around the function name, for example).
> 
> > > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Signed-off-by: Alejandro Colomar <alx@kernel.org>
> > > ---
> > >  include/linux/string.h | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/include/linux/string.h b/include/linux/string.h
> > > index 9e59f9697c9e..55ca4cb5122c 100644
> > > --- a/include/linux/string.h
> > > +++ b/include/linux/string.h
> > > @@ -590,7 +590,9 @@ void memcpy_and_pad(void *dest, size_t dest_len, const void *src, size_t count,
> > >   * *  @s+strlen(@prefix) if @s starts with @prefix
> > >   * *  NULL if @s does not start with @prefix
> > >   */
> > > -static inline char *strprefix(const char *s, const char *prefix)
> > > +#define strprefix(s, pfx)  const_cast(CQChar_of(s) *, strprefix(s, pfx))
> > > +
> > > +static inline char *(strprefix)(const char *s, const char *prefix)  
> > 
> > Why introduce a new coding style?  
> 
> It's not style; the parentheses are technically needed to avoid macro
> expansion, since the macro has the same name as the function.
> 
> Alternatively, I could rename the function to __strprefix().

Or put the #define after the function definition.

David

> 
> 
> Have a lovely night!
> Alex
> 

