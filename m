Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677959;
	b=Tq0OVP0RhSLk/ON+YqupAeg04BH0qY1swLK/M2QSQCY82rBT4rvQsEodX1XQwdARob2P
	 c9bawvXi4P/PQPvlZ+5oYprLIxPlyDocJxgaivG9hi7VkeQd4NO57LSjwjUQY89TmY6Fy
	 PuBjKO/dII1FpYAN8MZ+PioynAmj204AByaW88kpASPfit//YUUWtmjCXUw/4S6or0D1e
	 +CvF8VhwX8ZJsPSR6DKsTVIV8seSQ03BDDwIPvBaR3dQzCcGUJGDWwuWRW5I9DptwUX0V
	 gAwOmPStDqrr0cYTmlzF41bdyM7jWAJ4/cNBtUCTeG6XUh0VAc73LQmFRRUiGPBOZzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677959;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=8P7Tu0XAT+J8wnnHHa0JJQWbLO74zxbECpHOR7WiaRg=;
	b=oEjPElrPzCxXBSoMUqn5CUt9iXdYWFp/SpJvTUb+pUo47MAKvbCJtg0uG68PWMJ7IcJh
	 WfT6m0mgQG5Dqra0TIIrXCB4ZBQAPkJJQjG49br957W/7CP+yBca/HaT73NQAEfTzod/U
	 JHYgqhH1OLtj3SSo/P9Z5VyL68Cey/QblZL4+PaY2HpoIVYQIQwRAz5TCBrD90NBKKkSg
	 BMqBwsG4vX6zCpXIy7PxnmT0J+//PFwd+ngb94qeaA39V63cOdHdAptW4wK0Iz72XkOIb
	 rujhM2PUc1PCwv8je7ycmeALqUlW93qv0OARveTrEq2kDeVuxFsJaO9MauBfFww5NCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA52606A31A
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 14:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BFD1F000C6
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 14:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677957;
	bh=8P7Tu0XAT+J8wnnHHa0JJQWbLO74zxbECpHOR7WiaRg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=D5ofscP5XXx+2SDB9cBz9+0+d7YaxZRpSd/BAfwU/zcz1DfANMut7zYvBjbVrEWNj
	 LBSTiRxcaISYlK471Fqksrz7E5tBbg8KARV57ne4U0LtRTH8rItFYiIRG6y386uBXe
	 SnuoMzZmbL41FyGBg7UDRmVrtJ9ASEXnaTHDCqMVGjk9nmIIrgtmtnDvmGWm9rKsED
	 SdNgLzDJ1VCPLWE0Qv7UICOs1XmK3oF1SEeeXwOFbNJYxMrKuWfD5cOzd6PaLpXEP4
	 Z9lH0+borKwIV2nK2piYlK5tQirUfhosZw7kDzRLSRgao+FoxgnfkdFfXQXtWQEUoW
	 twwsUBiyy9UGw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so14351461fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 07:05:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwhEL1KKpMiMT3CIkUVbcvVnR9afyO1spqnEARRUfNlrsqkuScy3A2dIlXWAngYtK3G2xD/23SU+n0e@vger.kernel.org
X-Gm-Message-State: AFq9FYI4v94Mi1pIHmoovlc29NoWhXNv7SmUiT0BuMSu8YBTak/Qa0bO
	SOpmsSTwb0sJFGyQ3TqOjv+Vd8St70DvBE3SodhRU4Hz/Lkl3HQ/g/yngRBEnJKGQaitS+if4MM
	qFGCuutcvtTezIEG0qKi3lUAmv0IFIFvxozGia0B7Fw==
X-Received: by 2002:a2e:bc07:0:b0:3ab:3bf3:1606 with SMTP id
 38308e7fff4ca-3ac441ccc48mr16311271fa.24.1792677956442; Thu, 22 Oct 2026
 07:05:56 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 07:05:55 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 07:05:55 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <atoQfGQZeJDU3eMF@ashevche-desk.local>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MdHEzHBXx=P1-0Ut80P5=sQnPDwZRD-zdpoE75iHcJjBA@mail.gmail.com> <atoQfGQZeJDU3eMF@ashevche-desk.local>
Date: Thu, 22 Oct 2026 07:05:55 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfALArmtGmv6h_sPrwxQrqyjOECN9m-GVb9DKQ4kyBE1A@mail.gmail.com>
X-Gm-Features: AclHuK91436dEv-tuysiXiREQ2obPxuGn-weCmtQmrWU-2JJ7wbnUogLc2aR58E
Message-ID: <CAMRc=MfALArmtGmv6h_sPrwxQrqyjOECN9m-GVb9DKQ4kyBE1A@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpio: Introduce helper to dispose IRQ mappings
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Samuel Moelius <sam.moelius@trailofbits.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 15:32:44 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Thu, Oct 22, 2026 at 02:11:38AM -0700, Bartosz Golaszewski wrote:
>> On Wed, 21 Oct 2026 22:44:42 +0200, Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> said:
>> > I have noticed that a few drivers use almost the same code to dispose IRQ
>> > mappings. This series to deduplicate the efforts. I only converted a couple
>> > of the users (there are potentially more) in order to stay in the same
>> > subsystem.
>> The "few" being 2 testing drivers of which one (mockup) should ideally go away.
>> Do we really want to add more code to GPIO core that will only be used in
>> testing module(s)? I don't think this is useful, sorry.
>
> I meant a few. As I pointed these were chosen explicitly for the sake of not
> crossing the subsystem boundaries. I looked at Broadcom one, it is so big mess
> but I think I can get an advantage on it. Also there are other drivers that
> just need more work to check (and many of them are outside of drivers/gpio),
> but I'm pretty sure the new API has a good potential.
>

Would it be possible to provide at least one more user other than the testing
drivers?

Bart
