Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr [147.173.1.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CEE3C37B3
	for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 20:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.173.1.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787170441; cv=none; b=UJtw/kYPAAnw6t36XPQJvHOLKxVGSLwJjE9PsaTKRrlhTBxMlx5hHR0bJ08Qw3KvkGoTgm7CimXnkCj/pJBE1AiDWPxsRV/UidPVhHEteeKU7y7kalSFML/Og/W7c23ER9fmRYRIIA5X2dTbYKP1ybmCosVqlXjTIG/I0YiIevk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787170441; c=relaxed/simple;
	bh=xmlmx6zrhLsn/I5yX+JPNP0cpXNSkwc0jDeGms7/QWY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=ELIOlTpSbMkVNANWPjTARI1iqMk7kG9r/ksDRavEM4VikpT3jQhoyf98jIlOmKXQOF/ggVMwoejcb/Y25szQUwHrUma7IDgdHIzZ1VLI6oNTRHw2TNnf4CzBDjUzRyJ55nDaF7EZSnNf4+5h/4gmROGLB5JY+eTL0HQqw60U58Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grenoble.cnrs.fr; spf=pass smtp.mailfrom=grenoble.cnrs.fr; dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr header.b=Zm2OQ7K4; arc=none smtp.client-ip=147.173.1.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grenoble.cnrs.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr header.b="Zm2OQ7K4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
	s=202106-grenoble.cnrs.fr; t=1787170435;
	bh=XP05MTPXyWgm2G7/skWuEhIr9aSG8vdxo/K9nUc4umw=;
	h=Date:To:From:Subject:From;
	b=Zm2OQ7K4awv10nQkVU59//l8bSu/bD0EfcOcgMG7oWlPhjwY8n2ZKstH/retDfFYj
	 SxhdYDemIQWis7nSgBL5SPcWPG6p3/uFTiRqm2pXkvweH/kzI8vfdOR6Q8encGTyrz
	 jicgBVT/HlZbn4ptvvKVVmXA6oSzSl3MIGhiaJp/w/ev6p00nKZLMlm3DyJdO1zXSY
	 pEaTs5j55oRWAOHTthdaMRvB4547FaY3OrSZQhrTsFM9b3191rtfet0TbGXEuxbFdR
	 DWI4dNXXjNdi8HmjZqClZNMAEqHvpQABPRui8rlvne0YAoP+aQWaU9SFUIAsElu6ay
	 E/6Cfr5hCelVw==
Received: from [IPV6:2a01:e0a:1164:dba0:3770:5627:8c1d:d139] (unknown [IPv6:2a01:e0a:1164:dba0:3770:5627:8c1d:d139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id A5CBD183B67;
	Wed, 19 Aug 2026 22:13:55 +0200 (CEST)
Message-ID: <0eb5c26d-731c-4ebb-be34-76466cf57720@grenoble.cnrs.fr>
Date: Wed, 19 Aug 2026 22:13:55 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-gpio@vger.kernel.org
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Subject: [PATCH libgpiod] build: do not require a C++ compiler if it is not
 needed
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Languages specified in the meson project() function are considered hard
dependencies. When trying to build libgpiod in an environment lacking a
C++ compiler, the build fails with an obscure error message ("ERROR:
Unable to get gcc pre-processor defines").

As the C++ compiler is only needed for building the C++ bindings, do not
require it unless the option bindings-cxx is enabled.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
Note that this issue has caused a few failures on the Buildroot
autobuilders, e.g.:
https://autobuild.buildroot.org/results/d1c19ffa0c599bd2ba9be965a98fc8f778d6e366
https://autobuild.buildroot.org/results/c6b3c9311d628bdb4ea103431767493fab9a3668
https://autobuild.buildroot.org/results/8e799050c5779c680ff5e5136571f57d29239f2f
https://autobuild.buildroot.org/results/d6d8833acfe00559579defbbf3ca34c0edbe7869
---
 meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 7a6306d..a8a5b0b 100644
--- a/meson.build
+++ b/meson.build
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
 
-project('libgpiod', ['c', 'cpp'],
+project('libgpiod', 'c',
   version: '2.4',
   license: 'LGPL-2.1-or-later',
   default_options: [
@@ -56,6 +56,10 @@ opt_dbus                = get_option('dbus')
 opt_introspection       = get_option('introspection')
 opt_systemd             = get_option('systemd')
 
+if opt_bindings_cxx.allowed()
+  add_languages('cpp')
+endif
+
 if get_option('profiling')
   profiling_c_args    = ['-fprofile-arcs', '-ftest-coverage']
   profiling_link_args = ['-lgcov']

base-commit: 7d7b07738885d051a28bdfb5025c8eb73cdf23f8
-- 
2.43.0
