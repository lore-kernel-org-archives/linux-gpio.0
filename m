Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iHFhjLFj"
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DD7A7
	for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 05:59:41 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-46495e57cdeso1028114137.3
        for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 05:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702562380; x=1703167180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDI2hV6y0deIvvuYrfHtiJ1wkEAnQynuOfoO21nGhV8=;
        b=iHFhjLFjWwcsmzLHueaXQX5Z79/fl23HusDgdIAYIGQxFW6/aAfLtxpzPESjExp9to
         k0Ne3iEzd3pFw8tz3v8enH9XDhymohOAinAVmvTybTNkEvG9CZAI9zWUZe5VoYkWEgr3
         cLK0FobjVn/J/OM9PqJUjUXQH1f3oUYHc0Y3zHPzjn7oRt6oE1ch9d41yT3plY+iDt3K
         XoHs5sZPJXcl3PdqmzMVDaViHJyN2r8Oni9UcAiPJYpngJylVR7IgU8+ocIIZ+bN78Jw
         AhD9sGEIsi3BRUnpNxSRZdEv8yzu8efjnOw+zclKvAlG9KGx/jYGg99QicDnSgjoasFJ
         xGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702562380; x=1703167180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDI2hV6y0deIvvuYrfHtiJ1wkEAnQynuOfoO21nGhV8=;
        b=T5TW5UE39juz5GsKZBSK69lBhB2tY8hr/w+N7uwWb1elgAiSZZuLoz0WwYDCSes6lT
         pkidp1gOHng+vUD724yVlsaP+e1KROXhL+z9FHTHkRqD5WgrnDJmX0KA8A46IKKbh07f
         XsX82gNxIIC1Dyga6CzBSjk2J42KHNgAZYWuuVySkiHfP2dOC6WPb6q4iUmTUGFNUgUt
         Tfmqb3Bvn8gvFyM4WuCyN1SdfurSRmLTWxS0YWA6gRg9fvHA2984HI2NwvfRUaKvwpsh
         sjBx/SEWyl6BBncCDMCfL+xIhC1OsakEvvodu5E1OxOSDI/QZnLWIWgdx0b+q0X6sdqR
         3YDw==
X-Gm-Message-State: AOJu0Yyui01KEmW40HV1+zBlOCNWdPd5GYCS/4X1PaYAI/TpTCqKrLU6
	O6JmRH5V1N+btnz3nvcUrObzy6J0z85+E0KN81W8yg==
X-Google-Smtp-Source: AGHT+IGKzMQHqwdTEXQ22pUjXKsZ28K26qVfdsG3YEs+kdUf8y9DhPlsYWKgfsCt2YUio8zhXYWxNufAVbxqLtzLhDU=
X-Received: by 2002:a05:6102:5093:b0:464:8a32:d4cc with SMTP id
 bl19-20020a056102509300b004648a32d4ccmr3545547vsb.6.1702562379026; Thu, 14
 Dec 2023 05:59:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208102020.36390-1-brgl@bgdev.pl> <20231208102020.36390-3-brgl@bgdev.pl>
 <ZXMiq3wDOt9zFzuX@smile.fi.intel.com>
In-Reply-To: <ZXMiq3wDOt9zFzuX@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 Dec 2023 14:59:28 +0100
Message-ID: <CAMRc=Me5fzUaxQZ8Ec086papUpOD+chZ3+BM4CzASmB=ksh9kw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: use a mutex to protect the list of GPIO devices
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 2:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Dec 08, 2023 at 11:20:20AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The global list of GPIO devices is never modified or accessed from
> > atomic context so it's fine to protect it using a mutex. Add a new
> > global lock dedicated to the gpio_devices list and use it whenever
> > accessing or modifying it.
>
> ...
>
> > While at it: fold the sysfs registering of existing devices into
> > gpiolib.c and make gpio_devices static within its compilation unit.
>
> TBH I do not like injecting sysfs (legacy!) code into gpiolib.
> It makes things at very least confusing.
>
> That _ugly_ ifdeffery and sysfs in the function name are not okay.
>
> If you want do that, please create a separate change and explain the rati=
onale
> behind with answering to the Q "Why do we need all that and why is it bet=
ter
> than any alternatives?".
>

I can move it back to gpiolib-sysfs.c but this way we'll have to keep
the GPIO device mutex public in gpiolib.h.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>
