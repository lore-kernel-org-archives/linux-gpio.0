From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 0/3] constify pinctrl_ops and pinmux_ops structures
Date: Thu,  1 Sep 2016 20:42:18 +0200
Message-ID: <1472755341-9995-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:48184
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753393AbcIAVaE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2016 17:30:04 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Constify pinctrl_ops and pinmux_ops structures.  The complete semantic
patch used to make this change is as follows:

// <smpl>
@initialize:ocaml@
@@

let check file =
  let second = List.nth (Str.split (Str.regexp "linux-next/") file) 1 in
  let doto =
    "/var/julia/linux-next/" ^ (Filename.chop_extension second) ^ ".o" in
  Sys.file_exists doto

@r disable optional_qualifier@
identifier i;
position p;
@@

static struct pinctrl_ops i@p = { ... };

@script:ocaml@
p << r.p;
@@

if not (check (List.hd p).file) then Coccilib.include_match false

@ok@
identifier r.i;
struct pinctrl_desc e;
position p;
@@

e.pctlops = &i@p;

@bad@
position p != {r.p,ok.p};
identifier r.i;
struct pinctrl_ops e;
@@

e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@

static
+const
 struct pinctrl_ops i = { ... };

// --------------------------------------------------------------------

@r1 disable optional_qualifier@
identifier i;
position p;
@@

static struct pinmux_ops i@p = { ... };

@script:ocaml@
p << r1.p;
@@

if not (check (List.hd p).file) then Coccilib.include_match false

@ok1@
identifier r1.i;
struct pinctrl_desc e;
position p;
@@

e.pmxops = &i@p;

@bad1@
position p != {r1.p,ok1.p};
identifier r1.i;
struct pinmux_ops e;
@@

e@i@p

@depends on !bad1 disable optional_qualifier@
identifier r1.i;
@@

static
+const
 struct pinmux_ops i = { ... };
// </smpl>

---

 drivers/pinctrl/bcm/pinctrl-bcm281xx.c |    4 ++--
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c  |    4 ++--
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c  |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
