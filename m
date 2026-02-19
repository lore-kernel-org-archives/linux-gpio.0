Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC7D34CFAE;
	Thu, 19 Feb 2026 16:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771520124; cv=none; b=CrKsc3DKqsxL2WxpCfwJ62JIYLzGyn0zjQoJ1tBUNZMtkwAwjbKYcJIx6G6q+qgaggts1bqxIRmCFw11suz9Ml0AAjGfFof4Ud7Le1Sz0XLpzCgomv/cVcVSuUaJ8gXZMeiIgasSjzuL7WItpLSjaLdtAjcISUwT/VPO4hxVL+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771520124; c=relaxed/simple;
	bh=nCtqophTjfa1hWtJ1k7uYtsKUjYcajQO7cBV7Vqp3rE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=pHHHiasL4GkHuPHwsduEYVgcqgBYqRkG27M9T3BmFSJwywOFF+/IXc0CtgWqNe36FV+rF9M+iXVWU6fmEOpF9JJABnXG7hUgA6ZCkJTQtsP1d5x8hzr20Xw+s+I+QvO8ValEc31Q9dk5f4B9GnwOf6WqOMvkJE0s7MULnAjFUms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/rZWvyM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/rZWvyM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2941C4CEF7;
	Thu, 19 Feb 2026 16:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771520123;
	bh=nCtqophTjfa1hWtJ1k7uYtsKUjYcajQO7cBV7Vqp3rE=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=j/rZWvyM7Bp2ZrOJaimvqZP8UjXnPWRPrp8ZfbOoo46IMBkXQZo0XIt+VjNB8O496
	 JNS3860YyCzQ9Ps8XrP/zOMfjfdIblY187bSlmMgzucXpS9rVh5yPxoJcTgnzHcX0q
	 HIoHpzSJVEHo6icmPl1lF28Q6hvZFyKG6gsQ7yu+c/FfcTzsim+KjYZsaTeQEh/vCg
	 fuS4NnK/42WJK+hzsZNZhM67oxyXhmrf4DTXLaV/d1p3Cgnr4hFtI3tNfiAj1kdbKM
	 Jsl0PH2/KIgosnba+cx+YN8YNusiw47CHKByxFWOAT6cltvz/gzJpVLqVkEFiYV0q4
	 GRexFAMdGS1UA==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 17:55:20 +0100
Message-Id: <DGJ3H078RVW8.28AJL6FR3OKOO@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@oss.qualcomm.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com> <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com> <2026021900-trekker-twenty-9daa@gregkh> <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
In-Reply-To: <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>

On Thu Feb 19, 2026 at 5:39 PM CET, Bartosz Golaszewski wrote:
> On Thu, Feb 19, 2026 at 5:36=E2=80=AFPM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote:
>> > Provide an extended variant of device_match_fwnode() that also tries t=
o
>> > match the device's secondary fwnode.
>> >
>> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.c=
om>
>> > ---
>> >  drivers/base/core.c        | 14 ++++++++++++++
>> >  include/linux/device/bus.h |  1 +
>> >  2 files changed, 15 insertions(+)
>> >
>> > diff --git a/drivers/base/core.c b/drivers/base/core.c
>> > index f599a1384eec90c104601422b04dc2b4c19d4382..bbf1337978fafc35eb94bd=
a85e0bb7f6879879c0 100644
>> > --- a/drivers/base/core.c
>> > +++ b/drivers/base/core.c
>> > @@ -5326,6 +5326,20 @@ int device_match_fwnode(struct device *dev, con=
st void *fwnode)
>> >  }
>> >  EXPORT_SYMBOL_GPL(device_match_fwnode);
>> >
>> > +int device_match_fwnode_ext(struct device *dev, const void *fwnode)
>>
>> No kernel doc to explain what this function does?
>>
>> :(
>>
>
> It's not like any of the other variants from this file were documented
> but ok, I can add it in v2. Still, I'd like to hear if this even makes
> sense.

I'd argue that the other ones are very obvious, as they just encapsulate a
single operation rather than any logic, whereas this one does have some log=
ic.

Also, is there a reason why we need both device_match_fwnode() *and*
device_match_fwnode_ext()?
