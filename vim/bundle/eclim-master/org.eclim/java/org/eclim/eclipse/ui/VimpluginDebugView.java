/**
 * Copyright (C) 2008 - 2012  Eric Van Dewoestine
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.eclim.eclipse.ui;

import org.eclipse.swt.SWT;

import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Text;

import org.eclipse.ui.part.ViewPart;

/**
 * View used as a debug console for vipmlugin debugging output.
 *
 * @author Eric Van Dewoestine
 */
public class VimpluginDebugView
  extends ViewPart
{
  private static Text log;

  /**
   * {@inheritDoc}
   * @see ViewPart#createPartControl(Composite)
   */
  @Override
  public void createPartControl(Composite parent)
  {
    log = new Text(
        parent,
        SWT.LEFT | SWT.MULTI | SWT.READ_ONLY | SWT.H_SCROLL | SWT.V_SCROLL);
  }

  /**
   * {@inheritDoc}
   * @see ViewPart#dispose()
   */
  @Override
  public void dispose()
  {
    log.dispose();
    log = null;
  }

  /**
   * {@inheritDoc}
   * @see ViewPart#setFocus()
   */
  @Override
  public void setFocus()
  {
    log.setFocus();
  }

  public static Text getLog()
  {
    return log;
  }
}
