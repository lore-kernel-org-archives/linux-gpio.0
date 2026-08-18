Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B57F46D0A5
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 11:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787054205; cv=none; b=mo6MrMZB98XUUDzZBOej+ONo1gr+SoY4o2GpJlEDIF/uFacOfkwXtS4xWWIR6m0Gnmh84Qbyf330/35dQaWV7lCj1ul9qFwKJ3Sd3zHd96JOE5I37csEwsWZro5W1hy1tg/vMFqC7jLQuXYQ4vOKopxgF8y4xUcA2KM+ESb0OmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787054205; c=relaxed/simple;
	bh=MI7OFw1pXG7CP86J/vpurQUqCZ9ciRik8S7bYt8ws5w=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uO+t4LnYddJcpRpNCYc8qM37GV9eUNx9UrtXJqdZrNnOcQwd9omFCo7ZV5GOh/yGSuuaRY3SDXBFh6tUbP9Yz277hlt5peEDo0Piqx/BPyDE4Gw3Zd43i6bVDUO638dC8ebmGdGAJ2lVHpcmTsV9wJNZ6bpg95YM3iNX8NfJ1D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfEZ3QP8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfEZ3QP8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDDCC1F00A3F
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 11:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787054204;
	bh=machPITv9Bzw7PcKX42MO3bbd2pk1NvPFUl5LSbqcok=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=PfEZ3QP8ilvoESvSxQRgIugDE1RyTrSNZEf/ZS5B+xCB+zGLwIgsN/G70e1VGnnqi
	 Wj++FNisqN6Wf+OFb95rRyyzvqzN6aA94xSLdt5anRjtkplDyZDiClAHRZTl2Ciyvl
	 /G+2yrqcc1BGfSZHomZchmthADE5k/TpcdW/6VsyrHAglhOxvPAxyxnawq9eMUSsHR
	 Jdj1g3KhBBR43PZGjDnvsQr+96seHQI78tfAyIHO9cpBTu8jGqox7kF0lvqzMQCq5k
	 wVoxh8wZSrumlqahlpXHZ2FXWvqT2/lIYVI5xJCp2XIIU6Nz/w6QQ0nRYwPxP8S2U2
	 xl5OiLo3nZV5w==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a12ffc112cso7829311fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 04:56:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RocqT+7IAVJ7nErZhug/o/gdUiKusLI3HQ81zpc1oi9DqaDPfvHBjhytjlqJ+ljMoEcOWF1EB2D+8hg@vger.kernel.org
X-Gm-Message-State: AOJu0YyTQcnrwj6LADlxYcMG7MPSDUfYjjhelvaBc3xuzqlfITPB5Cb2
	QaRMZCfSRXIXm9K/Grf8I0wCF1RjKDs1fNukEtISlcGkBZ9T6mYPFvIqSpVXXSztqzBzNT4z/w2
	ccka8Z+7eN0kIQcP7dCpTfSyWzg2ALIS2IzVZrFBFfQ==
X-Received: by 2002:a05:651c:a204:20b0:3a1:749:3031 with SMTP id
 38308e7fff4ca-3a1793f0e77mr6227431fa.0.1787054202653; Tue, 18 Aug 2026
 04:56:42 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Aug 2026 04:56:40 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Aug 2026 04:56:40 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMuHMdXs8RmenPc_mODnZ08qVMXb_rZfA-A4hez96RbXdBjovA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813081231.8855-1-bartosz.golaszewski@oss.qualcomm.com> <CAMuHMdXs8RmenPc_mODnZ08qVMXb_rZfA-A4hez96RbXdBjovA@mail.gmail.com>
Date: Tue, 18 Aug 2026 04:56:40 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdZcbD3qiHvBG9kNjeSJgfyrehBnM8vPmS-ZjQuP2kMUQ@mail.gmail.com>
X-Gm-Features: AcwNN1ViqSj9WsNVv9nOFxpb1yOmnSaHZvBS4rlwL7CIYCxyzanftR6eiJAUFlk
Message-ID: <CAMRc=MdZcbD3qiHvBG9kNjeSJgfyrehBnM8vPmS-ZjQuP2kMUQ@mail.gmail.com>
Subject: Re: [GIT PULL] gpio updates for v7.3-rc1
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Aug 2026 09:49:50 +0200, Geert Uytterhoeven
<geert@linux-m68k.org> said:
> Hi Bartosz,
>
> On Thu, 13 Aug 2026 at 10:13, Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>> I'm sending my pull-request earlier as I'll be mostly OoO until September.
>>
>> There's one new driver for the Realtek DHC RTD1625 GPIO controller. If adding
>> it, reverting it and then adding it again raises your eyebrow: this was done
>> becuase the initial implementation - while correct - didn't use the gpio-regmap
>> abstraction that suited it nicely. The conversion was done after I had already
>> merged v7.2-rc2 into my tree so instead of rebasing, I went with a revert.
>>
>> The merges you see - other than pulling in your upstream tags with conflicting
>> fixes - are for a PR from Arnd containing his work on further isolating legacy
>> GPIO APIs and the fw_devlink support for software nodes that will go upstream
>> via the driver core tree.
>
> Still, there is a remaining conflict due to
>
>> Alex Tran (1):
>>       gpio: gpio-by-pinctrl: Apply initial value in direction output wrapper
>
> being v3 of a fix where v2 made it in v7.2-rc6.
> Note that I believe the resolution in next-20260817 is incorrect:
> https://lore.kernel.org/all/anyjJ6DSHWCjuB97@sirena.org.uk/
>

Thanks for the heads-up Geert.

Linus, please ignore this one, I'll pull the v7.2 tag into my tree, fix the
conflict and redo the pull request.

Thanks,
Bartosz
