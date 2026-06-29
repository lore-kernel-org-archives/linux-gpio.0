Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE473BB100
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729267; cv=none; b=oAA2sToflZ10rt1QxiKYiU13OXNTaHnu7I1N6VZwwqD7lhxK/xp42nWcGcYGmPu727ZZv+C+xdORtr+wPOEBuZcezv8BJhJvBFLutMswnfdB0A9youg9KOt/Vac98QQCF79swdoTXyrV183v/jD3V6NNMf97RFlQCZVKTmgD9wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729267; c=relaxed/simple;
	bh=PLJOCfhTmWpSVyjW5lUlxnMdY/RWF5AxyhZN/URi+LE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pFSwjLl/uB5YsgP5SBhrVIsRs67M76p2IBByPIN6ZmBNkWeuHpR7YbyakRKN7LWf9dPTZDavZQG3Qhbe67rqI+so9UXd78A8gdog8L3nEhLqFJTsm8gLLQjYikPTv/criCZsl6CIzvZdf1pclbtwCSBpejBQf1b+l2R0bwEorxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oArzvqpu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oArzvqpu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015461F00ACA
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 10:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782729266;
	bh=PLJOCfhTmWpSVyjW5lUlxnMdY/RWF5AxyhZN/URi+LE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=oArzvqpuxhBEF/cz5UN1KeueGsy6yIuSJC62lMy0bPtc/xT1nDnFitVkgA1pEjac3
	 Tx7d9F652RTRbVATZMgrWzrvUjFBOa/fN3VeZzDasUv37Qww2nug709aJpNuLzyJVq
	 Wgf+uj+ZOjiCKAg1Nx7Ysr7uzD8NgCiZZxmPdUgdpQ/Ej0QVthSqzyEY+VnxQ4dj3Y
	 cACFl9raPTjd4D5HUy2Oo/aOGV6q9WpqR2IWZV80NCOH+EglziyoXGXKelg/4SpqhP
	 aAWsL+g3RsLwum+PBVX0M9Tb+c1fw5zWSvLk6W098a+9wcbquisfIy0GYeHmdV6vCy
	 0MBY3ltjabN1Q==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39b011ae0b4so9510031fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 03:34:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpvq2kYWRYq38A+5Y6NQHlMBoY7cRsHtW0QUAp59bG+ExDpFaRlXN8w4a32vkfEr607RIVTVTo6+ZL/@vger.kernel.org
X-Gm-Message-State: AOJu0YymHVHcMGfrEaFIxX0FcRKVX9wwRaSBMe2YsdHsUOsitrHupkBu
	SgJUqYDTV3jYKd1uNOQ8KHuPU/xri0W01xU/EyiNodBcAoKg4Qgxl/HHuQTI9kWQ3p5HNpcazVk
	kOjy7G6O+QDWzRxRrQzxjj6NL4RsCzjNc/zwhzoqlGQ==
X-Received: by 2002:a05:651c:b2b:b0:39b:bd1:eaf8 with SMTP id
 38308e7fff4ca-39b0bd1f110mr7243761fa.9.1782729264742; Mon, 29 Jun 2026
 03:34:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 03:34:22 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 03:34:22 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <akCz48E0i6jqzmiC@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZarCgDvMUta4Viq@google.com> <CAD++jL=tK7w=vpCN9JBOmnqR99cX=rG5QKqqBKyRdztg9kSy1w@mail.gmail.com>
 <akCz48E0i6jqzmiC@google.com>
Date: Mon, 29 Jun 2026 03:34:22 -0700
X-Gmail-Original-Message-ID: <CAMRc=McDFiBNnY-4jcQJ0G0Y73T0X+G9wJ6_bjPdmwq-dPeNFA@mail.gmail.com>
X-Gm-Features: AVVi8CeaOd3k2vT1d8SQPdzePkgHwZFTIjvI69H2rDwGCs66NmE1byAlLurBzPQ
Message-ID: <CAMRc=McDFiBNnY-4jcQJ0G0Y73T0X+G9wJ6_bjPdmwq-dPeNFA@mail.gmail.com>
Subject: Re: [PATCH] gpio: amd-fch: switch to guard() notation
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Tj <tj.iam.tj@proton.me>, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 28 Jun 2026 07:42:50 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> On Thu, Feb 19, 2026 at 06:26:25PM +0100, Linus Walleij wrote:
>> On Thu, Feb 19, 2026 at 7:46=E2=80=AFAM Dmitry Torokhov
>> <dmitry.torokhov@gmail.com> wrote:
>>
>> > guard() is more concise and ensures that lock is released at the end o=
f
>> > the scope.
>> >
>> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>
>> That looks right!
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Bartosz, do you need me to resubmit?
>
> Thanks.
>
> --
> Dmitry
>

No, it applied fine. Sorry, it fell through the cracks.

Bart
