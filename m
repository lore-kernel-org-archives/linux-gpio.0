Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8731339377
	for <linux-gpio@vger.kernel.org>; Sat,  3 Oct 2026 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791046254; cv=none; b=G/yc2h2pbIKpfsV/9c6vLkzmPqFoXbYcfkgs+o14y2YguxQk02x1+KCMdDv9jbc0zUzSlasoiHYvJBK5ALywjqKYGuEnjMBaDT/DyOARZBK8/rJhIm91LOuNcAYtrLbXpSKrucRxRcdezxV6st4HRW3cWwKBFBhUaE/meC0J5Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791046254; c=relaxed/simple;
	bh=rgmi8cN+SpzR1LZvYNcsfQI3YjDiUwkUJG5FRv+tXy8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZaeBb0whch8Sk2cS5CmQ85XAUi0T9rS/OOxvD+wz2AbrYWuKyV4zKFPNxRkbRJdhQxfnetbbN0WP5Wl1p6ObehDsZH/DIl921n8FPSwAz5WQbcrEcHaxGFwA1NueAxV1LNAvhznslOUz32gnHuZLw740fJiMPj1ellGFeJpR5SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgw5qt2x; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgw5qt2x"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so2073435ad.2
        for <linux-gpio@vger.kernel.org>; Sat, 03 Oct 2026 09:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791046252; x=1791651052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o5nZhr5o/UkV60cwhqj+G+eK5fQZjsPv6PrbldXN5Gw=;
        b=jgw5qt2xQtANLaCSCmRTBi2JHZLY5CA9UEC0EUZ296TrPmMkmXoJNDMn/hlQITYX3W
         p3J0haqnVACBZngYnRd3ZjNJ3l1x8tTt71yB5L5DdvOlYDfdx0832kiO2o/qc1fvE1FH
         aALBLxk1vGfl+4byTAiqsLbdqXizqH1L45pbF1gbI2hxr71yooL/gPz6x/wTz0P2jJ2G
         ZW0hdEbtCJYyYy7j812Wka5gNOkP3clwR2iYdnnN+HqPy2q2jermruXXfD/a6hZT/EJM
         cTs1ANU9y3hH4EyqPyXVb/RU512RIVz3Df80Dt3pfSfJY4MkUncP1ati19IKuR3HtOBC
         wy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791046252; x=1791651052;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5nZhr5o/UkV60cwhqj+G+eK5fQZjsPv6PrbldXN5Gw=;
        b=SpJnWm1fPZtuP7GbjoBJOcbgE5prt6r/29AkInZ24CP80x0NVF8egGP9yrTHQwcBhx
         fQXopIA9tpTeKAhVq2P6qOg/DdeYZUVQnqpCUggfPQvmwkad43idpb4iW0xyI2ZhR5pU
         bCL0qSUjEQQbAzTg61tXIOgXcdVmbc32CLL5Sq3vArVaHGC30m/nAbXB6XTFRxnHj57W
         F0ljH+ZXsYbHmmp5+mMoWavFcNlL19ViGEwWBM62+vUfteT1U27gPclppV8kRO/x9CxZ
         NRC6BQ61ycfxf3V3LoEKbvkJIkhh2DCet8vZO9S/TzDwaTCS5dXydLzRwWBwbgW5eCVT
         w+dA==
X-Forwarded-Encrypted: i=1; AKwUvBxrF/v71APhGzBYyOPpg+wJ53w0seytp9n/jv+oVtsem8EDM6AQHEBs1/djg7k99Jyv2KtTWy5EwuMm@vger.kernel.org
X-Gm-Message-State: AFq9FYJk9T8IamwuwyQGTkvAKi9URhB+5OJHcJ0HZtq4Et8Ml3cdxNOA
	N2wLxeoEGP33P6Gs7RWveWeCVziegl5hJS2/E7jdFYsJ03i6dcoYdebw
X-Gm-Gg: AYBFou34j8AXeuKzd4dPpZnw4LWWKmomqsK5MFs4otr398Si8v+th74dIIa2oFaq5oV
	8zSi9bfX7T+ATUuG20YrrKA42OhQV90l1w/GAlq3Zm5H/9X7JLMcA82VdhBe1DykF+baFkxZISG
	xyCE5h2Lc7u4pxIxer4P08c7MC/di1/zv4Z2z8TjVhaBo9EgvWbraaJVcsi9n4XzAJtVdBM6Qw3
	xKAc5Kgx0mbx4qntiuRKseNQKASfDOHcGhXeIGOIWZwzcDKrogC6tY/ctIB9rnUH3eULPfI0yw6
	cOYcyHlBVUvipE1YktLSv6iKtJnTqentZi64fmKQ6JmACQqfVLDOprs2pzogdLpOt9EwpQp0JPe
	RgJLcLFsBc9NFGozne62RSW6r8zxp+0cvlr+dwqNX7Z4gHZyCOXn4NDh2OFaLvFzK+ToOP2PjSk
	KAwv6/clX3haBJtTAyyuUuIddDmk5m8ev9gGxB50as0YPZ8A62jfdvXvDOic3xd3JF0l7f7mgkv
	jpBIU+w6AKX2yEHWA==
X-Received: by 2002:a17:902:cec4:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2e49b60bfa4mr53807145ad.27.1791046252208;
        Sat, 03 Oct 2026 09:50:52 -0700 (PDT)
Received: from localhost (madb688426.ap.nuro.jp. [219.104.132.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6d65bbsm18157495ad.54.2026.10.03.09.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:50:51 -0700 (PDT)
Message-ID: <6ac1326b.0a67d0c9.2deb66.efb7@mx.google.com>
X-Google-Original-Message-ID: <20261003165049.6hj23qszaetwiqu5@DESKTOP-1P5QNTF.>
Date: Sun, 4 Oct 2026 01:50:49 +0900
From: Kohei Ito <koheiito.dev@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/3] rust: gpio: add GPIO module with common definitions
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
 <20260906-add-rust-gpio-consumer-v1-1-24d192f93760@gmail.com>
 <CAD++jL=pZG1ddc+v3ebeTKe-ZTKOTh-L0uXshaZWqOqyuqAYxQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jL=pZG1ddc+v3ebeTKe-ZTKOTh-L0uXshaZWqOqyuqAYxQ@mail.gmail.com>

Hi Linus,

thank you for your comments.

> > Add the top-level GPIO module with minimal common definitions. This
> > module is the basis for future Rust GPIO extensions.
> 
> Describe what you want to enable by this patch.
> 
> - Enabling in-kernel Rust code to use things from the
>   GPIO subsystem? (It looks like so.)
> 
> - Writing GPIO drivers in rust? (It seems like not.)

This patch is the first step to enable in-kernel Rust code to use things
from the GPIO subsystem. I'll clarify this in the commit message. The
patch series does not add Rust GPIO provider APIs or Rust GPIO provider
drivers, but it is intended to be the basis for them.

> > +/// Describes the raw GPIO level, i.e. the value of its physical line without regard for its
> > +/// ACTIVE_LOW status.
> > +#[derive(Clone, Copy, PartialEq, Eq)]
> > +pub enum PhysicalLineLevel {
> 
> No thanks.
> 
> We want to hide the actual physical line level inside the
> gpiolib (encapsulation).
> 
> We should not expose the physical line level at all
> unless there is a consumer in the kernel that absolutely
> needs this, and there is none.

Sure. I have no need to use the physical line level right now, so I'll
remove it and the related definitions.

Best regards,
Kohei Ito
