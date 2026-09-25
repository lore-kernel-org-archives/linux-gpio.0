Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ED6321F5E
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 09:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330086; cv=none; b=MBvdINAJ9WfX3PcIN1WRRTm8os5mpp/a/LMwNiqAMsqVIReS/RBpS+bFaP3UZNTK1oaS891spkMtUkjTnT+uhSZ1NdOKbCTe22ME5mysEkeJ8qF5IHomqaFg8otOH32hWywpyBk3WMDRppmuHueKYOK14pRVTii45uAcS19gMyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330086; c=relaxed/simple;
	bh=+3jX6/bt52BxbTDC+qllEa1vFrRklwk1KGRHlt4fJig=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlJTOMyzrW7PdpVH4hJOd1rhGMPRCov84UKI72LxvMVXyXnYpYGYaBIhIgPqioI6kKZp6arSvMR+fVuSeBpY0VF9N3V0tuTK18dTT7kIE86x5slnVhCOuB7CjQYPyMRohbZfZji+6IhQJ8OUPk8FnZLfZHkzsvE+yzMZQgtphkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWYd51tU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWYd51tU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B81F1F0089E
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 09:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790330085;
	bh=ZaNLFDRSwXCfrEluVZq320qsRCEu/azCDhiFKz8Q+tY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=kWYd51tUu8nyzeFuy7CWG0qpC+vCsBVFKrJaGfFrIs9+95ryQuZpwPFc7Yn754pd8
	 7nwRRmOntc339P1zTMIls7mGDhcgVQZhMYfbghvKgT0MO9/PKVANm1yfOOjbo4G0Hs
	 k4K++9ILhhoZZ7ruCE/eQNk8Y2rNjN/Qbn49+LtojEHyZA0kg7JEHLUN7ddq28A42f
	 8lFQ1ZDicKt8ATdeR3rAxPD9S3h8sSZt000IyJg6PWqlwhH9eagVpYkF7YMMy9olb3
	 gSSFTrvuMUy1XArc3UXiFsSN0FKNVfv3zs0k9rI7F0WfTCGBsvGOroxgd8BRR2srRS
	 NIN+5PZ+LM9gQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e986b8b1so383220e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 02:54:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxBX28T/+WfJmyG3d/5tN6ByLKoZuYq3d5/aGVCGQ5B8GA+uXKawoJGDEi/HEIsolPYS9ToL4hG6r4f@vger.kernel.org
X-Gm-Message-State: AFuF++mqa/e4paTSA2WGPTH+1OkrUJlseeuQexXaU8ftotodpsE0/hGK
	kXpY6wM24BpYPg8O+Ufz/yxdkyLlLhc8PCW9FANH4apah/cv1z/QX1CoLLyA8CtfAEcDUsT8E+5
	bqfE5VzrdmzPFKpd+cOrsg1PyGJ4RZgaJ/d6LzBswRQ==
X-Received: by 2002:a05:6512:2241:b0:5b8:c225:80cc with SMTP id
 2adb3069b0e04-5b8e0a06dd4mr1712078e87.34.1790330083746; Fri, 25 Sep 2026
 02:54:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Sep 2026 09:54:42 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Sep 2026 09:54:42 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAHp75VdBbr5TgEXrJ6XDQiPvsGfhyKQmVL+zUQ3mNS=GiWw1RQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924083512.461838-1-peng.fan@oss.nxp.com> <179032407610.10527.4008737984510756760.b4-ty@oss.qualcomm.com>
 <CAHp75VdBbr5TgEXrJ6XDQiPvsGfhyKQmVL+zUQ3mNS=GiWw1RQ@mail.gmail.com>
Date: Fri, 25 Sep 2026 09:54:42 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfdAU0fvYa-XzGvdeMPsAG7z+QeMP7zywNaRW-emRJjRw@mail.gmail.com>
X-Gm-Features: AclHuK_fRWkb_4SBm7n5J0faK_1uIHOcUqSlZCYUsRrB1zg-j1ayS0OFxxB4Dyw
Message-ID: <CAMRc=MfdAU0fvYa-XzGvdeMPsAG7z+QeMP7zywNaRW-emRJjRw@mail.gmail.com>
Subject: Re: [PATCH] gpio: wcove: use regmap_assign_bits() for conditional set/clear
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Sep 2026 10:27:55 +0200, Andy Shevchenko
<andy.shevchenko@gmail.com> said:
> On Fri, Sep 25, 2026 at 11:14=E2=80=AFAM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>> On Thu, 24 Sep 2026 16:35:11 +0800, Peng Fan (OSS) wrote:
>> > Replace if/else block using regmap_set_bits()/regmap_clear_bits() with
>> > the simpler regmap_assign_bits() call.
>>
>> Applied, thanks!
>>
>> [1/1] gpio: wcove: use regmap_assign_bits() for conditional set/clear
>>       https://git.kernel.org/brgl/c/428cb7603f95d0ee6fad06cbf56321b1bdea=
aa85
>
> Are you going to handle all the Intel GPIO drivers that have a
> MAINTAINERS record?
>

Sorry, backing it up. We really need to organize GPIO drivers by vendor...

Bart
