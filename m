Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9030A3921E9
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 07:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784274054; cv=none; b=amgoi5+/2oQJ0me6EHQFrSzMCGInebYSoonLjzjBUeQFwa3mzUouzg3uhnPXWfmh2HQRMt0VZ/xzMXXSkvWlrAgPd2s6Z6Sj/QYW8oGva2kaSZnjHe8QFy/Ow8RC+TToXxUwyvwJWCwZsGp4r9UyTFKz+tvSkZu2M/sQGAYqX+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784274054; c=relaxed/simple;
	bh=m0/sC2lpO7s7kazM/Kgba267MijE4BUKMXJY+PfAtRE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftEKoecen7KvkJbutEyYsvV6SolEM/iKoGe88KPo76NOoTZhWfe9R/2CAS4Bk2uvJIJbci71FaNNJMZ+vqsYS/PVefhOGZWTSAi+cHl5Nb3eKZPe6qMLq0LPAlwRxp//fbD9T9ZsfqMTPWUbgrIufpYdrWojN1evp4K1CtbbJ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXmTo1z9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXmTo1z9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA32A1F00AC4
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 07:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784274047;
	bh=OF/GIgG8fd5MLypU751MI0BaYGz3S/78pJ8DfriQZUQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=hXmTo1z9PwXS4iCAww1pY2cuG4u8++b5dXJQP2rB7ghPh5OICywHpawi/ejVO4pbQ
	 WtgYIFd8uihyMPaP+Px7c9mrsy4xEIXt9bVo/ygHxnJzUf9T007EScqpi7lBIuoGre
	 7zIOLGvskFQT4Zxapz8ZbQ+rCNLtpa5WZgStnw/rVjmZMQGQLChF6unDOq9wFgFcoe
	 TheTyUSO4ArcEuLSVuXJYnSszjrgQtkQiOKQhzhCxRXEeDixQv3+7lKhlGQ3+BkkgE
	 VbkEkjIYWZ84N+/LWLcF6u9FMKVLpbru5I6EAu9btAL3ffZs07azigSrsFUnykmGTB
	 qf0Utp/Xb+PDg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aeae771c49so8664853e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 00:40:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpgM+ebGQdVZbCjeZV4M4xINs7kC4ezhvinkYh0XQXPUu9/1ai4foova3w5TIf3RX2CFA43P2nCy7cw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Ni+C8k3jCqf0y8GqlCMh25bn0qv1NdCIAhFRSY/aBtgIE6fm
	1LLvt5AZhfj/6A3pYNMH7d5YItrijQiccQZCyiZ5T8HKFvy9J1Fd00yEx/RvDEbtoqPpgfZuRKE
	58qZenzWeipG00jUijAEQpX4RSziKZA/ht1YZN9HVew==
X-Received: by 2002:a05:6512:134c:b0:5ae:b9fb:1582 with SMTP id
 2adb3069b0e04-5b28f9a58c1mr290750e87.40.1784274046572; Fri, 17 Jul 2026
 00:40:46 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jul 2026 02:40:44 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jul 2026 02:40:44 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <alkn8HBmu_aDjKHK@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716113055.41319-1-hardikprakash.official@gmail.com>
 <CAMRc=MdN4AYdS8mz9JbVc8fCz7MOik+Dsthb-BviVtX3h987rQ@mail.gmail.com> <alkn8HBmu_aDjKHK@ashevche-desk.local>
Date: Fri, 17 Jul 2026 02:40:44 -0500
X-Gmail-Original-Message-ID: <CAMRc=MeMi7MjeX7uunV-=7XqKSimUd+obmiz2DmUHzrkGnK9iA@mail.gmail.com>
X-Gm-Features: AUfX_mz4kaPBjaCp-Q4-hplPXgATNakbKl0srkjAAPrMHQl0-Hr7xhqfK7EiIKM
Message-ID: <CAMRc=MeMi7MjeX7uunV-=7XqKSimUd+obmiz2DmUHzrkGnK9iA@mail.gmail.com>
Subject: Re: [PATCH v12] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hardik Prakash <hardikprakash.official@gmail.com>, linux-gpio@vger.kernel.org, 
	wsa@kernel.org, mario.limonciello@amd.com, brgl@bgdev.pl, 
	basavaraj.natikar@amd.com, linusw@kernel.org, nathan@kernel.org, 
	chaitanya.kumar.borah@intel.com, linux-i2c@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jul 2026 20:50:24 +0200, Andy Shevchenko
<andriy.shevchenko@intel.com> said:
> On Thu, Jul 16, 2026 at 07:10:47AM -0700, Bartosz Golaszewski wrote:
>> On Thu, 16 Jul 2026 13:30:55 +0200, Hardik Prakash
>> <hardikprakash.official@gmail.com> said:
>> > I2C controllers may have child devices with GpioInt resources that
>> > depend on GPIO controllers being fully initialized. If the I2C
>> > controller probes and enumerates children before the referenced GPIO
>> > controller has completed probe, GPIO interrupts may not be properly
>> > configured, leading to device failures.
>> >
>> > On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
>> > AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
>> > pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
>> > AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
>> > fail with lost arbitration errors:
>> >
>> >   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
>> >   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
>> >   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
>> >   2.348157  lost arbitration
>> >
>> > Add a dependency check that walks ACPI child devices and defers probe
>> > until any referenced GPIO controller is bound.
>> >
>> > Fixes: 3812a9e84265 ("pinctrl-amd: enable IRQ for WACF2200 touchscreen on Lenovo Yoga 7 14AGP11")
>> > Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
>> > Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>> > Signed-off-by: Hardik Prakash <hardikprakash.official@gmail.com>
>> > Assisted-by: Claude:claude-sonnet-5
>> > Assisted-by: DeepSeek:deepseek-v4-pro
>> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=221494
>> > ---
>>
>> Looks good to me.
>>
>> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> But this is wrong. It's a patch over v11 (basically it's a diff v11..v12).
>

Hanging my head in shame as I admit I've barely glanced over the diff that
looked much smaller now. Will pay more attention next time.

Bart
