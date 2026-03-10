Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D083337E2E3
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 10:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773140058; cv=none; b=uj0nMnNjU0ZWvotFAqSps00iRIxgtn28trvgPpiWBL/tR815CBvlNYgiVV+LAvsc6aM5pw/QjpMHITuHUH7M59irn+9honZWKCTtL6XxPkm1lnU7Pnlv+E0BOlztWqlKgDURBqKlYvpQdzSKepxqxkDZrfTqBAFCU5gDkW8S0dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773140058; c=relaxed/simple;
	bh=/uXiIWu6WiAwtUvUjXrVN8fPUq78XOUzEs/7RfrrZ5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLI9q+CaBiUB5IvOMGReKPv6WQF4Rz0NZQsOSo9I0U9tNpyXopX3A9dZDsiG1rs0EzoGCcg67DUQgeZxX072cl460oQgoJ2V/Xhhq4hJGgw3eTD+oJ+cBkGs0cJPhxlaqXDPDwD7CL44qMwxMdxxwMHky65ZIRuE8va6L60Z4xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4lMtkbA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4lMtkbA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860B9C4AF0B
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 10:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773140058;
	bh=/uXiIWu6WiAwtUvUjXrVN8fPUq78XOUzEs/7RfrrZ5w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e4lMtkbAyKfieTT3tPbAmjNKoyW0bTcAjtO8iRngsr8sLGNlFZwm25WN1FxYgPKuN
	 IhxoBLIZ+/x8H9HHd++nvToYPrqDICtBQw6k7H/2sSdS0rgsd8t9pFD5tpOHqe75Jn
	 fr9qgf2QRUn3g1jSrNumlxOa5GFTPDB9mTeCcjjCOdA3QCkyn0SmYGlB8pu+fOdeg+
	 UCMicJc3nRIiBYNQk9b9zWqmSQUAQl5ILGyKLXkpk/6W/2W9227u8kNDDzNGqmvP5l
	 oGDiQV032pRI5MCno90Im4cJY6Ukm0adl0xtYdUHWqJNGpMwkXvxXzWYlKafVZpUuc
	 sEj+woUXkC3pA==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ad46a44easo11381862d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 03:54:18 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx779wJKp2PYf4tpqmSRedvyWWgU/Tx1b+TTXXc4j7U2Qvun9uO
	e6icjPZ+1ie4xbqMsmepjmJQCrAmRCNYwFcENZSiTtcKjx6xya/fy7btH/t9prgFtC+Vqw/15g1
	KRT3hvXBenMbFbrx2fJ5ZEkwtENqvDYo=
X-Received: by 2002:a05:690e:b88:b0:64a:f0cd:d3d with SMTP id
 956f58d0204a3-64d142f8dddmr13225387d50.64.1773140057831; Tue, 10 Mar 2026
 03:54:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227164335.2044035-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260227164335.2044035-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 11:54:06 +0100
X-Gmail-Original-Message-ID: <CAD++jLkcY1PWPwaHZJ88UnLuCUS0EBnDjPpDe_EH-tFqAwmmVA@mail.gmail.com>
X-Gm-Features: AaiRm525foUsaQmDTDckJzLQdTVrjHLx-NbXR3vFn7yEg50OZR_C28QN_4ByDMI
Message-ID: <CAD++jLkcY1PWPwaHZJ88UnLuCUS0EBnDjPpDe_EH-tFqAwmmVA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: cy8c95x0: Avoid returning positive values
 to user space
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, kernel test robot <lkp@intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 5:43=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> When probe fails due to unclear interrupt status register, it returns
> a positive number instead of the proper error code. Fix this accordingly.
>
> Fixes: e6cbbe42944d ("pinctrl: Add Cypress cy8c95x0 support")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202602271847.vVWkqLBD-lkp@intel.com/
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied for fixes!

Yours,
Linus Walleij
