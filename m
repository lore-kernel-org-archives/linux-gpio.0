Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3BD3803FA
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 10:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773140149; cv=none; b=kg5TXa9nJ6sJGxM8LEsdh8FSVhl4JZQWyC3DNYpBZFz4voWsaMD4pqc6T9/b+GHOYltC1t1qnTQSAxtnVL5m8dP7Q8A3KxkrLtB6RGzqWnYMJqeP+b4/7pCqLcYNDwDdX7jytmy5dioZ3BRwJ0S7/SfKi53XnTPL24Uklsv143s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773140149; c=relaxed/simple;
	bh=kauLYPuXhnTtDAnTQPj317FpgAeTAKjLIT8IZZbNMMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tu8QdABzxZ9X8z/5RL2CZXG2k4j+9jSMnP/byN4w0sdH5LkzLdhNLgPVa6x05VDMlPMOLXCA7yr9sj/M6p4IXRDrUBBFtj2ap/7GqIIkxk01zIU17LNBwuHceQB9ecCvaQys+aPiE0K9f3V/v7oA7Ng67Jg0D7fZWat+6w7HHYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=urWyt9FB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="urWyt9FB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF84C2BC86
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 10:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773140149;
	bh=kauLYPuXhnTtDAnTQPj317FpgAeTAKjLIT8IZZbNMMs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=urWyt9FBJGyQ1aHPnlVHz9p9EV8+7Q+wvJMhswvggHtQJVWsa1F4me5Ty5aoLxvNI
	 ZpU3a+0VryCznVGh7TP30t40GrrBQ3cQXC4I2f6OqAmBzXFAkY9CkdWLj1qmgznz3F
	 VAVr1KgYgkrrRVJzh/20MGZgQIoQnvfzVIqxTc83Fi71rirjVF+IPOUjNWuOAEeyLr
	 bdkvXsMQ4cs4vK6OZTPiJqUUXhJIH0sqDDtq6S03F+dGgvg8wIZCZ6b7lqvDpYAYOv
	 081I/nlkLM11HOYPxDtYtqs5G7WcfWKnBo3mvQ4vJHbInwjyrTxyynquOiw5KyhEy+
	 CGpIW7SqIc6Gw==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79801df3e42so165541027b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 03:55:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YwtP0OizzTuj4MHTfiHGymLE2QdvZgjx6BRPSKYxLyY6rBZyyBK
	6vxJksEj5d/5sQT2cwuBFUDiX68ZziK4w8J08w96iObUgsrc/cfyjH1aLoDoDoOIzvbceyYGzWU
	6nzOELVvH1Dgocx7NisgCIeTfSV9JosU=
X-Received: by 2002:a05:690c:c:b0:798:3be8:b66a with SMTP id
 00721157ae682-7990a4e7aabmr28254467b3.0.1773140148740; Tue, 10 Mar 2026
 03:55:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227164335.2044035-1-andriy.shevchenko@linux.intel.com> <CAD++jLkcY1PWPwaHZJ88UnLuCUS0EBnDjPpDe_EH-tFqAwmmVA@mail.gmail.com>
In-Reply-To: <CAD++jLkcY1PWPwaHZJ88UnLuCUS0EBnDjPpDe_EH-tFqAwmmVA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 11:55:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLk_hDYR8kMDFGL8Lnw7YUskf6R3ovGf-PEorZUjmQ-aoA@mail.gmail.com>
X-Gm-Features: AaiRm52P8WkSc6IOm4NBH3QoXtAegR7JjPCR9uoaf_qRZjVvQntd00NYUSQaKzU
Message-ID: <CAD++jLk_hDYR8kMDFGL8Lnw7YUskf6R3ovGf-PEorZUjmQ-aoA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: cy8c95x0: Avoid returning positive values
 to user space
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, kernel test robot <lkp@intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 11:54=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
> On Fri, Feb 27, 2026 at 5:43=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>
> > When probe fails due to unclear interrupt status register, it returns
> > a positive number instead of the proper error code. Fix this accordingl=
y.
> >
> > Fixes: e6cbbe42944d ("pinctrl: Add Cypress cy8c95x0 support")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202602271847.vVWkqLBD-lkp@intel.com/
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Patch applied for fixes!

Or no, for next actually, it doesn't apply to fixes... noticed
after applying to next.

Yours,
Linus Walleij
