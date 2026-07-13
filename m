Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C33E3624AB
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 06:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924975; cv=none; b=sUhA/MyWcFl7H/J04HsFVMv/n9D5NkhkBOYO7sXq9jTqCgS8dy83a+U4eOxS8QYRI/l/vV20FxhpChnVsu0Zv1WzT+wuMxJNncytuzMtl4YlPlYYaT6FlhkLz4useNtuRiFJV94RoyMrP63hIPjQDL4AHYiUKSCvz7ys+kPLuJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924975; c=relaxed/simple;
	bh=wF+50x4WR4nUIApE4b5YwSyGtnnp6S4PzQgBSpdTHJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFbIaWsk92eDOMehBgX4vTqxb0Tdp2CYZho76JXiRlxsgheLc3CvMi/aHPKknOXaUHtgtlWTdYk4a4Q/aw89tah8qt6AInrcIyAZ8yTg5KbUSXaxsWMw5ewup5TaiiwJ+UN803lxpGvQj8+ffKVnu9S91oDixg9/FBBc5DLD0A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=OydUL6E5; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b="OydUL6E5"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381b831d535so3241901a91.0
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 23:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1783924971; x=1784529771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8F/9zD3r7YezsDRc+m/kmeYtHVS5rAcBBS81Gja9RZg=;
        b=OydUL6E5qluuPsWDK/NW0pWo0rLnVSJeT+iuHrwfWVLguB+fgaOmS2LKGHfEAczG4w
         owmSyWYyIh2KbUt9Da6+dTDI9MCrGk0q7HMYgdOwOGkD81Aq6KEuSQBdREWy8xaSqhzC
         iYAfXhry0YHQAUn5DZ0VEuo9Y/Uh70HLAri6YdBPuuzuxqnm+z3FSTS+yV39xg8+rEoo
         fWYnC6bAsYlqZ0foks+BOFZuwMs/SL/1WZ/gteaqui9LWJ151YEkP0MQWBfM6hAhyq+i
         ra7moktiQ0aNsi+qVaXMB54JnaELscKv9BYk1aO8zbFtdXG+vo65UOfS5ZY2mo2cMeQU
         jErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924971; x=1784529771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8F/9zD3r7YezsDRc+m/kmeYtHVS5rAcBBS81Gja9RZg=;
        b=Nuh/nbupnNhU+XNs8mcjGdX0kEhqTXvjL7izf1TG7ptkEBulwsX2vt0QEKvi3U75Js
         lRZzM3aO0GlASomJMGmg1LPzObxigBOXOUqbfyBHagBnB4nDFK28XsGq2ZU4zId97y4t
         dpypLA/FQ3ZO/qQfCUWodG8EHM3ntAStE7LJDSryUVpMNHmmVefBxkLa2TKLFGv/pWRC
         QqX0kQNkxF4DzikBHUdUpiwZmYjU3wuqdt4JbFnq63cZDl7HOZ8WXsi+G0dKN5n1cCEF
         WntY9m1pa3k3jiw4P3nlZxYaA2MIR6yZvTSfqgS8bh5DDU2g35qcHCIyxEeh+DRjT4mC
         px7A==
X-Forwarded-Encrypted: i=1; AHgh+RohWY1YqunZk49+Rt2seBuGx2n7pUqE6upYmFd3ua61fTP76HsYwh8toVv/120dfC5AwYQ/2Mwn1UBC@vger.kernel.org
X-Gm-Message-State: AOJu0YxKdWIXT5WziTPe7oPQ26d8/WjHvAselQGU16uuVEclK0OjndbW
	vrVepUobqFQaNfyFnIazKNZ2Ww8JTfUgxpOZqIQZHHOZRnZw+WHAtJekubUwP36cQww=
X-Gm-Gg: AfdE7cmBBaTr3GH5W0Yd8uZZsGZlmcncyjaCQpxf33i3zrVe/TRvmBi12nAVYJdggtQ
	JcLRhiMCh10Yt67+GMFNoYrkb4CXKPy0yrSEwH14tCuXTeqyR/ABls0jN93ge4p4e0wfRlgfCKR
	JKJbnufrgVBSfbRXkSCyReH5WQBbKU3pAIRdo1EnmwF8epDSjaw6CjeO2CWfTylfxlnbRZhJjjy
	T7IgigT8uWfn4OgbjqwdsvX5WlUa/2LPsAkuibDLcAjDvWWqH/2HMVfTrd7zQizxnDHbiNA8koT
	O2mGaxez/HQDkVd8rFGTK9/1Svr39tszlS2zWUgdCZ57oyWFYzuK5Hi702TdlpjnmsWUxTEHxwo
	RADXudSB5d1uVkQv48l2L6ER77wBUeaMnMWgXLqnj91yQWrXyhdQyYzb829ZhF6pzKrDEiklmGw
	1o8SiQiXA2PesBM7a+dZJhybXqDN42OepjHQMKz5nqsWwKwGDlQ10BxiTDpz2KBMBTRA/s7p1XP
	2WBPNDDM8W2lywoSwJeZKXS1XgC
X-Received: by 2002:a17:90b:4990:b0:366:52fe:e749 with SMTP id 98e67ed59e1d1-38dc73beb6dmr8826851a91.5.1783924971384;
        Sun, 12 Jul 2026 23:42:51 -0700 (PDT)
Received: from Metius ([103.158.43.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119d5cf176sm42365281eec.12.2026.07.12.23.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:42:50 -0700 (PDT)
Date: Mon, 13 Jul 2026 12:12:44 +0530
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: Fix memory leak in
 gpio_la_poll_probe()
Message-ID: <rraksab74pmllyp5zqr3tlbqe65twqgan5362hitk236mxguci@uhcrd2hzdi5c>
References: <20260710064838.153528-1-nihaal@cse.iitm.ac.in>
 <alNd92hOOETILWG-@ninjato>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alNd92hOOETILWG-@ninjato>

Hello,

On Sun, Jul 12, 2026 at 11:27:19AM +0200, Wolfram Sang wrote:
> On Fri, Jul 10, 2026 at 12:18:36PM +0530, Abdun Nihaal wrote:
> 
> > The memory allocated for priv->blob.data is not freed in the error paths
> > that follow the fops_buf_size_set() call in gpio_la_poll_probe(), as
> > well as in the remove function.
> 
> There is no memory allocated at that time. Hmm, maybe I should add a
> comment explaining it.
> 

What I meant was that after the priv->blob.data is allocated
successfully in fops_buf_size_set(), the subsequent error returns in
gpio_la_poll_probe() don't free the buffer, but directly return (since
all the other allocations are device managed). And so I feel that there
is a leak possible here.

    fops_buf_size_set(priv, GPIO_LA_DEFAULT_BUF_SIZE);
    // After a successful allocation in fops_buf_size_set()

    priv->descs = devm_gpiod_get_array(dev, "probe", GPIOD_IN);
    if (IS_ERR(priv->descs))
    	return PTR_ERR(priv->descs);    // Leaks here

    /* artificial limit to keep 1 byte per sample for now */
    if (priv->descs->ndescs > GPIO_LA_MAX_PROBES)
    	return -EFBIG;                  // Leaks here

    // And leaks in all subsequent error paths

If you prefer, I can remove the return code check for theh
fops_buf_size_set() call and just have the devm_add_action_or_reset()
part for releasing.

Also I don't see the buffer getting freed in the remove function
gpio_la_poll_remove(), unless it is implicitly freed by
debugfs_remove_recursive().

We are using a prototype static analysis tool based on LLVM, which we
are building for a research project.

Regards,
Nihaal
