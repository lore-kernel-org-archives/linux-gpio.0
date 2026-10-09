Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B4F42AF9B;
	Fri,  9 Oct 2026 06:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526025; cv=none; b=tSNMNi854KoU1+RLTCUEvNVmBmQ9K9naeofeGM2Gi7X6eHJB7y06fpsfVxR8uokaeJchJMWZrYC6PwK9oMMr6MuEEjoCmpBN57urN17mN6NaRKCSemQ1rFWqltsv63aIkkPKFuK7K01GPmXYmytD39OPJzYx/wYMWt7Ol1Z25BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526025; c=relaxed/simple;
	bh=Phb4dHibtKdbOqzaPc1gD95N0uipgl57XLq6/ofO/c0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArzdhMiOrL7LqSmDlhJdK4jgIWvlrQjJ8hP3wJ9gB1dXIwAPirMn2BfItYtJqQUPe/LKs5s3jhxi94dRKn2IBrC6t9Jr6LB8mV1wbwwWK3GRoEH6f8SHWDeVFiBabKSTNtGVfsFe9JfE8ayieqoCeIuQ0xcU2D9LQFT1al6b6mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSErbQ8l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSErbQ8l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1141F000FF;
	Fri,  9 Oct 2026 06:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526023;
	bh=OctUAXDPvUUqnQ5ahpqmNhSfJYP5MUZ5+RP5C0uhZuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YSErbQ8lf7gyDxCkWPCasNcpKZTiv8JY7s3eOp2RZweBQrVTlFQbPjLzhI25Kmf8m
	 57hOYxXLyeF+oJ1TyogoN7EAtVMG0pRM5fljRUOW8DyKrjl2zbpOXyGe7EHwkhHAH4
	 TvneSL9XUjegH6UOevIMa9bZXt2ngYSKnmJaxfYJtNEwjLLhrhTTUhGNKoS/jBUGKn
	 6ZXc9QY9tnxNgY5EOPkwK9Edwm53smbACv99eIkkaHSG+T3ot9yaSRtyiESI+E64Qy
	 kAZXTjZEEWuzGL/DnlKDFW64VlttbmTeunrRNFmG4lTZUHzaykNoj+OkOn3BTsAMcP
	 QcISnRWEElEyA==
Date: Fri, 9 Oct 2026 08:06:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, Sergey Shtylyov <s.shtylyov@omp.ru>, 
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: core: fix pin name leak on radix_tree_insert()
 error path
Message-ID: <20261009-lucky-lively-binturong-57ebe3@quoll>
References: <20261009054556.3151123-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009054556.3151123-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 13:45:56 +0800, Haotian Zhang wrote:
> pinctrl_register_one_pin() allocates pindesc->name with kasprintf() when
> the pin has no static name, and marks it with pindesc->dynamic_name.  If
> the subsequent radix_tree_insert() fails, the function jumps to the
> failed label, which only calls kfree(pindesc) and never frees the
> dynamically allocated name, leaking it.
> 
> Since the insertion failed, the pin is not in the radix tree, so the
> caller's pinctrl_free_pindescs() cleanup cannot find it and cannot
> release the name either.
> 
> Release pindesc->name on the failed path when it was dynamically
> allocated.
> 
> Fixes: ecfe9a015d3e ("pinctrl: core: handle radix_tree_insert() errors in pinctrl_register_one_pin()")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/pinctrl/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof




