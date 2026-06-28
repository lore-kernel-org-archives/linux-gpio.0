Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A8E3101A7
	for <linux-gpio@vger.kernel.org>; Sun, 28 Jun 2026 05:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782625377; cv=none; b=t22vbLWD12712dfa1P3tyoHqK7/u5upuZnuPufwNmSpTit7WaeQJ8EKv6KjCGp2++ACsVevCz4HaCqw/9KV+572xqWBZDlRaFfAmauKgDaxZb1XRY5ts1KTdMjTVKYzQaZKdkNH5IWRTe+ljU1cK3wWV/EX2KG7Yb18Beno1l9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782625377; c=relaxed/simple;
	bh=wEU6RlzMmPj3vwHyeVijBCf2GYxX5FBc6kTWl/OvW7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OL8CMJxvV1OkVX6N1VgKJrgLv/Bdm98xMymKQyIKwRn8xZEW6GIv9J4rYG+J/lX4CK7TisXQsGoEm0Ta9xLV8fH3V582YD2uJOEAQfZJWDO9i/xAY5eJ0AFnZs9KfpVw+bTaURN716CbS2Sd1309yKsDk7EMfO62WAn9fQD2O5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emyEE5Re; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emyEE5Re"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so5866189eec.0
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2026 22:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782625376; x=1783230176; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n4q3s0iq058f2mfiICzcmbq2srXPnTFy8iFai1LrYro=;
        b=emyEE5ReDRBJvCqb1JBjsjOE9F/EItV6CGiP4YZ/6B7ET8b1lPG90L1/DJB7WRX42B
         qlP5yMZ8+WbGp/ilcS6bUjxSUClD7Wt9WHOzXlKdzCzzVNOX7ea3ANSfB6/yzBmCzyRt
         fRpKZvJ9fS3BSVxB1N7xpd5pgn/EPrBAoNe5gJ/0BEXyFczpwNtouDbJaZs7thPh4Vmm
         xwXVeL6X2XeF1fhCMEI83MbRqhrEMe39LLkb88xHpUYz97v6+b6ATM95gENiG8PZK5il
         JXQg/r/hxH4Y7UkPN7XWE2L3rx3jmxaz1adlcr+h9BxWX5YfwPYE1Guo2/8Nde32JdXj
         bCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782625376; x=1783230176;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n4q3s0iq058f2mfiICzcmbq2srXPnTFy8iFai1LrYro=;
        b=ke+Pqc6Y42LYX7siAoMLOXTigqHTytklwY4wFv3NUM9tAjs9dyns44K+of9CvQhyOv
         Qfo8ENcJEdgnXwjQiN1HPp+sX+b0K7AlpohPGWYeQxJ0AmFZeb8H6bkOTk6Y4Cnho7od
         ONXFj/GMJQoETZ2Ox4sAqhXkYqYVgIVPtiZWFIU6SlKONjnRYKqEZQ1uDTe4M0JzsoLY
         Lr2V4VSaG0hwST7O8m3rgxgqbX0wKxDLCwWdjmlpWJVs4xsSVRLOhYT+TKJNZpDm4dT7
         tmYHlIfp4slIUOs7AgAc9XPWGfClXIz5hkYbF+Su06PCT4qokfloqv/T5bAnJ7516hmB
         8JaA==
X-Forwarded-Encrypted: i=1; AHgh+RrHDFktbv6zMcDOaMzIenYgYLtsJYC62ly4hX/jF7pvHhR05u8igpBiRRdQSXVsyh5HAlEA5c7AKUpb@vger.kernel.org
X-Gm-Message-State: AOJu0YzCUSQoSx4dwfQ/9/VaoQafv3NQVZQ62TzXv6lgChdwUEZ+Da5n
	zJFz2L7cj//6Qy3CCXQpffdROBpnNGSUXGs6WZpMvS1Dp3E3Bh6KyGe5
X-Gm-Gg: AfdE7cnx7Z+u6LXuDJ89GB/rYNJYoOyAJj7ta3mWhSnEBxiEm7XmXeL1EUdGIHmRYzP
	0VFA32opsjvzSKlAOjArHe2D1Kcc9uv2Pg8CctkDph104xw/uRUQnak3k+YGVqmWHq8D5ZIe9Wk
	MYVbe5ywMjp+y7Y44YK4nchNIYwNyPFL5+OAYELEUk7LyJWg/eGvDJQ9trskEx/BWqM/8iXVlOy
	b0lDuT21xbVa04HaHDcg7Xp8vAkPwqhR+E6KX3jW2jrt6jm/n+fijncqyO6vZNVDH8UVzehRsnr
	L1tUxGcc5I8d6LneMfsr4NR9jcC92ykFwNWqV4b5M6dtTVv+Tnf0mtjgn4UkvlrpdjK2IRyoP5J
	lLZU0ZmdhtJJ1diEZXn+laotFQ2hOKOIFWbCk4rLJBwpximHoAC6g2XjXsNbJjpC7sHuKnY7D96
	J+v0DjfYn/B1lmdFPJ+7o+vOAD1LUXxyRB59lIi6uSTtvmuHUmoq9PRg==
X-Received: by 2002:a05:7300:8b15:b0:304:e72a:d4d9 with SMTP id 5a478bee46e88-30c84d0d612mr12847847eec.19.1782625375757;
        Sat, 27 Jun 2026 22:42:55 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:977e:876b:dc75:9723])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c570b7bsm32451677eec.12.2026.06.27.22.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 22:42:52 -0700 (PDT)
Date: Sat, 27 Jun 2026 22:42:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Tj <tj.iam.tj@proton.me>, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH] gpio: amd-fch: switch to guard() notation
Message-ID: <akCz48E0i6jqzmiC@google.com>
References: <aZarCgDvMUta4Viq@google.com>
 <CAD++jL=tK7w=vpCN9JBOmnqR99cX=rG5QKqqBKyRdztg9kSy1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=tK7w=vpCN9JBOmnqR99cX=rG5QKqqBKyRdztg9kSy1w@mail.gmail.com>

On Thu, Feb 19, 2026 at 06:26:25PM +0100, Linus Walleij wrote:
> On Thu, Feb 19, 2026 at 7:46 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > guard() is more concise and ensures that lock is released at the end of
> > the scope.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> That looks right!
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Bartosz, do you need me to resubmit?

Thanks.

-- 
Dmitry
