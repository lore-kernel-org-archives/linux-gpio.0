From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: qcom: remove static globals to allow
 multiple TLMMs
Date: Tue, 27 Mar 2018 15:33:02 +0200
Message-ID: <CACRpkdZ=z7EncPykPwK+m-_qM3J2PokmkcoKsRqao_X1qx7CSg@mail.gmail.com>
References: <1521848700-22214-1-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1521848700-22214-1-git-send-email-timur@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Timur Tabi <timur@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Mar 24, 2018 at 12:44 AM, Timur Tabi <timur@codeaurora.org> wrote:

> Two data structures are declared as static globals but are intended to
> be per-TLMM.  Move them into the msm_pinctrl structure and initialize
> them at runtime.
>
> Signed-off-by: Timur Tabi <timur@codeaurora.org>

Waiting for a review from Stephen or Bjorn on these two
patches.

Yours,
Linus Walleij
