/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ifrs.ejb;

import javax.ejb.Remote;

/**
 *
 * @author lucaxrl
 */
@Remote
public interface IConta {
    
    public float debitar(float quantidade);
    
    public void depositar (float quantidade);
    
}
